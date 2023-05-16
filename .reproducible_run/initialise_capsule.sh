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
# CREATE NEW GITHUB REPOSITORY AND ATTACHED CAPSULE TO IT
##################
rm -r .git


