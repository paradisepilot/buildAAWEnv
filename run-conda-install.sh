#!/bin/bash

echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] run-main.sh begins"

### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ###
pkgsCONDA=( \
    "conda=23.3.1" \
    "pip=20.0.2" \
    "gdal=3.6.3" \
    "libgdal=3.6.3" \
    "earthengine-api" \
    "google-cloud-sdk" \
    "python=3.11.3" \
    "pandas=2.0.0" \
    "numpy=1.24.2" \
    "scipy=1.10.1" \
    "scikit-learn=1.2.2" \
    "stac-geoparquet" \
    "georasters" \
    "osmnx" \
    "pystac" \
    "rioxarray" \
    "sklearn-xarray" \
    "stackstac" \
    # "pyarrow" \
    "r-base=4.2.3" \
    "r-terra=1.7_23" \
    "r-rgdal=1.5_32" \
    "r-gdalutilities=1.2.4" \
    "r-gdalutils=2.0.1.14" \
    "r-sf=1.0-12" \
    "r-sp=1.6_0" \
    "r-cairo=1.6_0" \
    "r-dggridr=3.0.0" \
    "r-gdistance=1.6" \
    "r-geosphere=1.5_18" \
    "r-ggmap=2.6.1" \
    "r-ggspatial=1.1.8" \
    "r-gstat=2.1_1" \
    "r-proj4=1.0_12" \
    "r-raster=3.6_20" \
    "r-rastervis=0.44" \
    "r-rgee=1.1.5" \
    "r-rgooglemaps=1.4.2" \
    "r-spacetime=1.2_2" \
    "r-spatialeco=2.0_0" \
    "r-spatstat=3.0_3" \
    "r-spdep=1.2_8" \
    "r-stars=0.6_1" \
    # "r-cshapes" \
    # "r-openstreetmap" \
    # "r-rts" \
    # "r-vapour" \
    )

pkgsPyPI=( \
    "geowombat=2.1.6" \
    "geemap=0.20.5" \
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
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] creation of new empty environment (${myEnvName}) begins"
conda create --yes --name ${myEnvName}
sleep 2
myEnvFolder=`conda env list | egrep "${myEnvName}" | sed 's/[ ][ ]*/ /g' | cut -d' ' -f2,2`
echo;echo "[`date +"%Y-%m-%d:%H-%M-%S"`] creation of new empty environment (${myEnvName}) complete"

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
