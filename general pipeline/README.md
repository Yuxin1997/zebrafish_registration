# Procedure of registration

## Prerequiste1: Compile ANTs in cluster
https://github.com/ANTsX/ANTs/wiki/Compiling-ANTs-on-Linux-and-Mac-OS

## Prerequiste2: OpenCV
```pip install opencv-python```

## Step1: data preprocessing
* To be consistent with atlas, rotate/Flip horizontally/Flip z of z stack by fiji, and save as tiff file *zstack.tiff* and nrrd file *zstack.nrrd* respectively(be careful that when you save as nrrd file, some of stack will be flipped)
* Average recording video into 2d image, and also check whether its direction is the same as zstack. Save it as tiff file *averaged_video.tif*.

## Step2: Find reference plane in zstack by template matching


## Step3: 2d and 3d registration

## Step4: Apply transformation onto centroid coordinates
* 
