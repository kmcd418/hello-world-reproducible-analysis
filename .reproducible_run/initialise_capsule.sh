##################
# INSTALL DVC AND DEPENDENCIES
##################
pip install -r requirements.txt

##################
# INITIALIZE DATA VERSIONING
##################
dvc init
dvc config core.analytics false

##################
# CREATE DATA AND RESULTS DIRECTORY
##################
mkdir ./data
mkdir ./results