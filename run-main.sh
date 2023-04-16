#!/bin/bash

echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] run-main.sh begins"

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
timeStamp=`date +"%Y%m%d%H%M%S"`
myEnvName=envGeo${timeStamp}
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] ${myEnvName} environment build begins"

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] creation of new empty environment (${myEnvName}) begins"

# conda create --yes --clone base --name ${myEnvName}
conda create --yes --name ${myEnvName}
sleep 2

myEnvFolder=`conda env list | egrep "${myEnvName}" | sed 's/[ ][ ]*/ /g' | cut -d' ' -f2,2`

echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] creation of new empty environment (${myEnvName}) complete"

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] conda installation (to ${myEnvName}) begins"
conda update --yes --name base --channel conda-forge conda=23.3.1
sleep 2
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] conda installation (to ${myEnvName}) complete"

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] pip installation (to ${myEnvName}) begins"
conda install --yes --name ${myEnvName} --channel conda-forge pip=20.0.2
sleep 2
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] pip installation (to ${myEnvName}) complete"

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] conda env list"
conda env list

echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] myEnvFolder=${myEnvFolder}"
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] which python=`which python`"
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] CONDA_DEFAULT_ENV=${CONDA_DEFAULT_ENV}"
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] CONDA_PREFIX=${CONDA_PREFIX}"

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] package installation (to ${myEnvName}) begins"
conda install --yes --name ${myEnvName} --file envGeo.yml
sleep 2
echo "[`date +"%Y-%m-%d:%H-%M-%S"`] package installation (to ${myEnvName}) complete"

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] ${myEnvName} environment build complete"

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] run-main.sh complete"
echo;echo
