# drone-SysID-Sim

Fusion of the drone identification and simulation pipelines

## Installation

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

As this repository relies on some GitLab repositories, we also need to install these. For convenience, a shell script is created for this. To install the additional repositories, run

Linux:
```
./install-repos.sh
```

Windows:
```
install-repos.bat
```

You will need permission to access these repositories, in case you are unable to clone one of them due to permission issues, do not hesitate to contact me (j.j.vanbeers@tudelft.nl) for access.


## Adding other Python libraries

If you would like to add your own libraries, you can install them through

```
pipenv install <package_name> --dev
```
