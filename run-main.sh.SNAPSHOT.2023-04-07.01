#!/bin/bash

echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] run-main.sh begins"

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
pkgsCONDA=( \
    "gdal" \
    "libgdal" \
    "earthengine-api" \
    "google-cloud-sdk" \
    "stac-geoparquet" \
    "georasters" \
    "osmnx" \
    "pystac" \
    "rioxarray" \
    "sklearn-xarray" \
    "stackstac" \
    # "pyarrow" \
    "r-terra" \
    "r-rgdal" \
    "r-gdalutilities" \
    "r-gdalutils" \
    "r-sf" \
    "r-sp" \
    "r-cairo" \
    "r-dggridr" \
    "r-gdistance" \
    "r-geosphere" \
    "r-ggmap" \
    "r-ggspatial" \
    "r-gstat" \
    "r-proj4" \
    "r-raster" \
    "r-rastervis" \
    "r-rgee" \
    "r-rgooglemaps" \
    "r-spacetime" \
    "r-spatialeco" \
    "r-spatstat" \
    "r-spdep" \
    "r-stars" \
    # "r-cshapes" \
    # "r-openstreetmap" \
    # "r-rts" \
    # "r-vapour" \
    )

pkgsPyPI=( \
    "geowombat" \
    "geemap" \
    "geoparquet" \
    "dggrid4py" \
    "earthpy" \
    "ease-grid" \
    "easepy" \
    "pydggrid" \
    "rHEALPixDGGS" \
    )

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
timeStamp=`date +"%Y%m%d%H%M%S"`
myEnvName=envGeo${timeStamp}
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] ${myEnvName} environment build begins"

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] conda update begins"
conda update --yes --name base --channel conda-forge conda
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] conda update complete"

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] environment cloning (base to ${myEnvName}) begins"

conda create --yes --clone base --name ${myEnvName}
sleep 2

myEnvFolder=`conda env list | egrep "${myEnvName}" | sed 's/[ ][ ]*/ /g' | cut -d' ' -f2,2`

echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] environment cloning (base to ${myEnvName}) complete"

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] pip installation (to ${myEnvName}) begins"

conda install --yes --name ${myEnvName} --channel anaconda pip
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
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] conda packages installation begins"
for temppkg in "${pkgsCONDA[@]}"
do
    echo "    [`date +"%Y-%m-%d:%H-%M-%S"`] conda installion begins: ${temppkg}"
    conda install --yes --name ${myEnvName} \
        --channel conda-forge \
        --channel "conda-forge/label/broken" \
        --channel "conda-forge/label/cf201901" \
        --channel "conda-forge/label/cf202003" \
        --channel "conda-forge/label/gcc7" \
        --channel esri \
        --channel phausamann \
        --channel r \
        --channel vfonov \
        ${temppkg} > stdout.conda-install.${temppkg} 2> stderr.conda-install.${temppkg}
    echo "    [`date +"%Y-%m-%d:%H-%M-%S"`] conda installion complete: ${temppkg}"
done
echo "[`date +"%Y-%m-%d:%H-%M-%S"`] conda packages installation complete"

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`]: pypi packages installation begins"
for temppkg in "${pkgsPyPI[@]}"
do
    echo "    [`date +"%Y-%m-%d:%H-%M-%S"`] pip installion begins: ${temppkg}"
    ${myEnvFolder}/bin/pip install --no-input ${temppkg} > stdout.pip-install.${temppkg} 2> stderr.pip-install.${temppkg}
    echo "    [`date +"%Y-%m-%d:%H-%M-%S"`] pip installion complete: ${temppkg}"
done
echo "[`date +"%Y-%m-%d:%H-%M-%S"`]: pypi packages installation complete"

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] ${myEnvName} environment build complete"

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] run-main.sh complete"
echo;echo
