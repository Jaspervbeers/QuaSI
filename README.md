# QuaSI

Modular Python-base quadrotor simulation and model identification pipeline. Please read the provided `User_manual_QuaSI.pdf' in the root directory for a detailed explanation of the pipeline, including example files and documentation. 

## Installation

### Using the provided pipenv

To ensure the the Python versions remain consistent across the scripts, we use a pipenv virtual environment. This manages the necessary Python packages. 

If you do not yet have pipenv installed, you can install it through:

```
$ pip install pipenv
```

To install the Python depedencies, run (in the repository root directory):

```
$ pipenv --python 3.8 install
```

This will install the packages from the pipfile.

To enter the environment, in the root directory of this repository, run:

```
$ pipenv shell
```



**Adding other Python libraries**

If you would like to add your own libraries, you can install them through

```
pipenv install <package_name> --dev
```


### Custom installation 

You will need the following packages and Python 3.8 to use QuaSI:

- numpy = 1.20.3
- pandas = 1.3.4
- matplotlib = 3.4.3
- tensorflow = 2.8.0
- dill = 0.3.4
- scipy = 1.7.1
- tqdm = 4.62.3
- seaborn = 0.11.2
- sympy = 1.12



### Installing the custom libraries
This repository relies on the following libraries:

- [sysidpipeline](https://github.com/Jaspervbeers/sysidpipeline.git)
- [droneidentififcation](https://github.com/Jaspervbeers/droneidentification.git)
- [dronesim](https://github.com/Jaspervbeers/dronesim.git)
- [droneviz](https://github.com/Jaspervbeers/droneviz.git)

For convenience, a shell script is created for this. To install the additional repositories, run

Linux:
```
./install-repos.sh
```

Windows:
```
install-repos.bat
```

You may need permission to access these repositories, in case you are unable to clone one of them due to permission issues, do not hesitate to contact me (j.j.vanbeers@tudelft.nl) for access.
