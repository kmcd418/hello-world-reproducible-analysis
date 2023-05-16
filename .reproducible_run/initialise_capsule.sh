##################
# INSTALL DVC AND DEPENDENCIES
##################
pip install -r requirements.txt

##################
# INITIALIZE DATA VERSIONING
##################
dvc init
dvc config core.analytics false
dvc config core.autostage true

##################
# ADD S3 BUCKET TO ANALYSIS
##################
ANALYSIS_NAME=${PWD##*/} # get name from parent directory
AWS_ACCOUNT=$(aws sts get-caller-identity --query Account --output text)
AWS_REGION=$(aws configure get region)
ANALYSIS_BUCKET="s3://sagemaker-${AWS_REGION}-${AWS_ACCOUNT}"
echo "===== VERSIONING DATASET ====="
# Check if DVC remote exists
if dvc remote list | grep 's3bucket' >/dev/null 2>&1; then
    echo "DVC config setup. Nothing to add"
    dvc remote remove s3bucket
    dvc remote add -d s3bucket "${ANALYSIS_BUCKET}/${ANALYSIS_NAME}"
else
    echo "DVC config not setup. Adding..."
    dvc remote add -d s3bucket "${ANALYSIS_BUCKET}/${ANALYSIS_NAME}"
fi

##################
# CREATE DATA AND RESULTS DIRECTORY
##################
mkdir ./data
mkdir ./results
