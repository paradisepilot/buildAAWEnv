
conda create  --yes --clone baseClone --name    envTEST
# conda install --yes --name  envTEST   --channel anaconda    readline
# conda install --yes --name  envTEST   --channel conda-forge readline 
# conda install --yes --name  envTEST   --channel conda-forge r-base
conda update  --yes --name envTEST --channel anaconda    pip
conda update  --yes --name envTEST --channel conda-forge readline
conda install --yes --name envTEST --channel conda-forge geopandas
conda install --yes --name envTEST --channel conda-forge shapely

pip install --no-input rHEALPixDGGS
pip install --no-input easepy
