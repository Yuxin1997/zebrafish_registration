# Procedure of registration

## Prerequiste1: Compile ANTs in cluster, if you want to do the step4 in your own laptop, you should also compile ANTs on it.
https://github.com/ANTsX/ANTs/wiki/Compiling-ANTs-on-Linux-and-Mac-OS

## Prerequiste2: OpenCV,tifffile
```
pip install opencv-python tifffile
```

## Step1: data preprocessing
* To be consistent with atlas, rotate/Flip horizontally/Flip z of z stack by fiji, and save as tif file *zstack.tif* and nrrd file *zstack.nrrd* respectively(be careful that when you save as nrrd file, some of stack will be flipped)
* Average recording video into 2d image, and also check whether its direction is the same as zstack. Save it as tif file *averaged_video.tif*.
* Segmented ROI centroids coordinate information, it should be listed as a .csv files,the format could refer *To be run in cluster/example_coordinates.csv*, z infomation is from step2's matched slice z depth, all x,y,z unit is micron not pixel. 

## Step2: Find reference plane in zstack by template matching
run *opencv_template_matching.ipynb*, the printed number is the matched slice no.
Then use fiji to save this slice as tif file *ref_slice.tif*

## Step3: 3d registration(only could be run on cluster)
run the following call in cluster, it run *reg_zstack_to_atlas.sh*
```
sbatch registration_3d.slurm
```
You need to check warped file and evaluate the registration performance by this file.

## Step4: 2d registration and apply transformation onto centroid coordinates(on cluster or any computer compiled ANTs)
run the following call in cluster or run *reg_video_to_zstack.sh* and *apply_transformation_to_ROIs.sh*, if you want to run in cluster, you could also combine registration_2d.slurm and registration_3d.slurm together and run it
```
sbatch registration_2d.slurm
```
the file *example_coordinates_reg.csv* is the reigstered coordinate information.
