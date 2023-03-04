#!/bin/bash

echo;echo starttime=`date`

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
pkgsCODA=( \
    "earthengine-api" \
    "google-cloud-sdk" \
    "geemap" \
    "rioxarray" \
    "earthpy" \
    )

pkgsPyPI=( \
    "rHEALPixDGGS" \
    "ease-grid" \
    "dggrid4py" \
    "pydggrid" \
    )

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
timeStamp=`date +"%Y%m%d%H%M%S"`
myEnvName=envGeo${timeStamp}

echo;echo "environment cloning (base to ${myEnvName}) begins: `date`"

conda create --yes --clone base --name ${myEnvName}
sleep 2

conda activate ${myEnvName}
sleep 2

echo;echo "environment cloning (base to ${myEnvName}) complete: `date`"

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
echo;echo conda packages installation begins: `date`
for temppkg in "${pkgsCODA[@]}"
do
    echo conda installion begins: `date`: ${temppkg}
    # conda install --yes -c conda-forge ${temppkg} > stdout.conda-install.${temppkg} 2> stderr.conda-install.${temppkg}
    echo conda installion complete: `date`: ${temppkg}
done
echo;echo conda packages installation complete: `date`

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
echo;echo pypi packages installation begins: `date`
for temppkg in "${pkgsPyPI[@]}"
do
    echo pip installion begins: `date`: ${temppkg}
    # pip install --no-input ${temppkg} > stdout.pip-install.${temppkg} 2> stderr.pip-install.${temppkg}
    echo pip installion complete: `date`: ${temppkg}
done
echo;echo pypi packages installation complete: `date`

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
# conda update --yes -name base conda
echo finishtime=`date`
