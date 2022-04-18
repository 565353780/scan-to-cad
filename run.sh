cd Routines/Script
python Annotation2Mesh.py # Visualize data
python CADVoxelization.py # Voxelize CADs (shapenet)
python GenerateCorrespondences.py # Generate data (correspondences)
cd ../../Network/pytorch
./run.sh # Train heatmap prediction
ls
cd ../../Routines/Script
python Alignment9DoF.py --projectdir ../../Network/pytorch/output/dummy # Run alignment algorithm
python Alignment2Mesh.py --alignment ./tmp/alignments/dummy/scene0470_00.csv --out ./ # Mesh and view alignment result
cd ../../

