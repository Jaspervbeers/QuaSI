@echo off

echo "[ INFO ] Extracting data..."
copy /b data\raw.zip* data\__ALL__.zip
if errorlevel 1 echo "[ ERROR ] Failed to combine zip files of raw data. You may need to extract these manually using e.g. 7zip: https://www.7-zip.org/"
powershell -command "Expand-Archive data\__ALL__.zip data"
if errorlevel 1 echo "[ ERROR ] Failed to extract .zip files of raw data. You need to do this manually using e.g. 7zip: https://www.7-zip.org/"
del data\__ALL__.zip
if errorlevel 1 goto echo "[ ERROR ] Failed to delete combined .zip file of raw data: __ALL__.zip, you may delete this file manually."


echo "[ INFO ] Continuing with repository cloning..."

echo "[ INFO ] Installing sysidpipeline from: https://github.com/Jaspervbeers/sysidpipeline.git"
git "clone" "git@github.com:Jaspervbeers/sysidpipeline.git"
if errorlevel 1 goto sysidInstallFail

echo "[ INFO ] Installing droneIdentification from: https://github.com/Jaspervbeers/droneidentification.git"
git "clone" "git@github.com:Jaspervbeers/droneidentification.git"
if errorlevel 1 goto droneidInstallFail

echo "[ INFO ] Installing droneSim from: https://github.com/Jaspervbeers/dronesim.git"
git "clone" "git@github.com:Jaspervbeers/dronesim.git"
if errorlevel 1 goto dronesiminstallFail

echo "[ INFO ] Installing droneViz from: https://github.com/Jaspervbeers/droneviz.git"
git "clone" "git@github.com:Jaspervbeers/droneviz.git"
if errorlevel 1 goto dronevizinstallFail

exit /b 0


:sysidInstallFail
echo "[ ERROR ] Could not install sysidpipeline. Please check that you have the correct permissions."
exit /b 1

:droneidInstallFail
echo "[ ERROR ] Could not install droneidentification. Please check that you have the correct permissions."
exit /b 1

:dronesimInstallFail
echo "[ ERROR ] Could not install dronesim. Please check that you have the correct permissions."
exit /b 1

:dronevizInstallFail
echo "[ WARNING ] Could not install droneviz. This repository is not essential, but some visualizations may not work."
exit /b 2