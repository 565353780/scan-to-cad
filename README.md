# Scan To CAD

## Source

```bash
https://github.com/skanti/Scan2CAD
```

## Download Dataset

```bash
ScanNet :
https://github.com/ScanNet/ScanNet

ShapeNet (ShapeNetCore v2.0):
https://shapenet.org/

Scan2CAD :
https://github.com/skanti/Scan2CAD
```

and run this

```bash
ln -s <path-to-ScanNet-folder-root> ./Routines/Script/
ln -s <path-to-ShapeNet-folder-root> ./Routines/Script/
```

## Install Requirements

```bash
sudo apt install liblapack-dev libsuitesparse-dev libcxsparse3 libgflags-dev libgoogle-glog-dev libgtest-dev libjsoncpp-dev libeigen3-dev
sudo ln -s /usr/include/jsoncpp/json/ /usr/include/json

git clone https://ceres-solver.googlesource.com/ceres-solver
cd ceres-solver
mkdir build
cd build
cmake ..
make -j
sudo make install

conda create -n cad python=3.8
conda activate cad
pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu113
pip install numpy numpy-quaternion plyfile PyWavefront pybind11
```

## Build

```bash
conda activate cad
cd Routines/Vox2Mesh
make -j
cd ../DFGen
make -j
cd ../CropCentered
make -j
cd ../Keypoints2Grid
make -j
cd ../AlignmentHeatmap
mkdir build
cd build
cmake ..
make -j
cd ../../..
```

## Run

### Simple

```
conda activate cad
cd Routines/Script
./run.sh
```

### Step by step
```
conda activate cad

cd Routines/Script
python Annotation2Mesh.py # Visualize data
python CADVoxelization.py # Voxelize CADs (shapenet)
python GenerateCorrespondences.py # Generate data (correspondences)

cd ../../Network/pytorch
./run.sh # Train heatmap prediction

cd ../../Routines/Script
python Alignment9DoF.py --projectdir ../../Network/pytorch/output/dummy # Run alignment algorithm
python Alignment2Mesh.py --alignment ./tmp/alignments/dummy/scene0470_00.csv --out ./ # Mesh and view alignment result
```

## Enjoy it~

