'''
Main script for the quadrotor model identification and simulation pipeline
'''
import subprocess
import sys
import os
import json
import shutil

rootDir = os.getcwd()

'''
Functions
'''
def runScript(name, cwd = rootDir):
    os.environ["PWD"] = cwd
    try:
        prcs = subprocess.check_call([sys.executable, f'{name}.py'], cwd = cwd)
    except subprocess.CalledProcessError:
        os.environ["PWD"] = rootDir
        raise RuntimeError(f'Could not run [{name}.py]')
    os.environ["PWD"] = rootDir

# Add relevant paths to sys.path such that our repositories are available
paths2Add = [
    os.path.join(os.getcwd(), 'dronesim'),
    os.path.join(os.getcwd(), 'droneidentification'),
    os.path.join(os.getcwd(), 'sysidpipeline')
]
if os.path.exists(os.path.join(os.getcwd(), 'droneviz')):
    paths2Add.append(os.path.join(os.getcwd(), 'droneviz'))

for p in paths2Add:
    sys.path.append(p)

# Pass relative import locations, adjusted for the root directory, to each repository
with open('relativeImportLocations.json', 'r') as f:
    _relativeImportLocations = json.load(f)
relativeImportLocations = {k:os.path.join(os.getcwd(), v) for k, v in _relativeImportLocations.items()}
with open('droneidentification/relativeImportLocations.json', 'w') as f:
    json.dump(relativeImportLocations, f, indent = 4)

'''
Script flow booleans
'''
doProcessing = True 
doIdentification = True 
doMATLAB = True 
doSimulation = True



'''
Processing
'''
if doProcessing:
    # Overwrite local processConfig.json with root directory version
    with open('processingConfig.json', 'r') as f:
        processConfig = json.load(f)
    with open('droneidentification/processingConfig.json', 'w') as f:
        json.dump(processConfig, f, indent = 4)

    # Call the processData.py script
    runScript('droneidentification/processQuadData')


'''
Identification
'''
if doIdentification:
    # Overwrite local identificationConfig.json with root directory version
    with open('identificationConfig.json', 'r') as f:
        identificationConfig = json.load(f)
    with open('droneidentification/identificationConfig.json', 'w') as f:
        json.dump(identificationConfig, f, indent = 4)

    # Call the polynomial model identification script (note V3 is latest and most modular)
    runScript('droneidentification/buildDronePolyModel')


    # Make the model standalone
    with open('standaloneConfig.json', 'r') as f:
        standaloneConfig = json.load(f)
    standaloneConfig.update({'model path':f"../{identificationConfig['saving models']['save directory']}"})
    standaloneConfig.update({'model ID':identificationConfig['saving models']['model ID']})
    standaloneConfig.update({'droneConfig path':f"../{standaloneConfig['droneConfig path']}"})
    with open('droneidentification/standaloneConfig.json', 'w') as f:
        json.dump(standaloneConfig, f, indent = 4)

    # Call the model packaging script
    runScript('makeStandalonePolyModel', cwd = os.path.join(rootDir, 'droneidentification'))


# Port to MATLAB
if doMATLAB: # NOTE: Only possible once a standalone model exists! 
    with open('MATLABConfig.json', 'r') as f:
        MATLABConfig = json.load(f)
    MATLABConfig.update({'model path':f"../{MATLABConfig['model path']}"})
    MATLABConfig.update({'droneConfig path':f"../{MATLABConfig['droneConfig path']}"})
    with open('droneidentification/matlab_compatibility/modelConfig.json', 'w') as f:
        json.dump(MATLABConfig, f, indent = 4)

    # Call the model packaging script droneidentification/matlab_compatibility/
    runScript('toMATLAB', cwd = os.path.join(rootDir, 'droneidentification', 'matlab_compatibility'))



'''
Simulation
'''
if doSimulation:
    with open('identificationConfig.json', 'r') as f:
        identificationConfig = json.load(f)
    with open('standaloneConfig.json', 'r') as f:
        standaloneConfig = json.load(f)
    # First copy necessary standalone model files over
    modelDir = identificationConfig['saving models']['save directory']
    modelName = identificationConfig['saving models']['model ID']

    extensions = ['Fx', 'Fy', 'Fz', 'Mx', 'My', 'Mz']
    subfolder = 'standaloneDiff' if standaloneConfig['make moment DiffSys'] else 'standalone'
    if not os.path.exists(os.path.join('dronesim/models', modelName)):
        os.makedirs(os.path.join('dronesim/models', modelName))
    for extn in extensions:
        shutil.copy(os.path.join(modelDir, modelName, subfolder, f'{modelName}-{extn}.pkl'), os.path.join('dronesim/models', modelName, f'{modelName}-{extn}.pkl'))
    # Check if velocity-form exists, and if so, copy it over as well
    if os.path.exists(os.path.join(modelDir, modelName, subfolder, 'PQR-DiffSys.pkl')):
        shutil.copy(os.path.join(modelDir, modelName, subfolder, 'PQR-DiffSys.pkl'), os.path.join('dronesim/models', modelName, 'PQR-DiffSys.pkl'))

    # Modify droneSimConfig and move
    with open('droneSimConfig.json', 'r') as f:
        droneSimConfig = json.load(f)
    droneSimConfig["model"]['model ID'] = modelName
    with open('dronesim/droneSimConfig.json', 'w') as f:
        json.dump(droneSimConfig, f, indent = 4)
    runScript('droneSim', cwd = os.path.join(rootDir, 'dronesim'))