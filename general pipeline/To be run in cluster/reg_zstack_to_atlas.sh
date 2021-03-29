
# reference is your processed z stack
reference=ref/HSA.nrrd
# moving file is your averaged calcium trace volume
moving_file=fish1.nrrd

# step1； register your moving file onto reference file
antsRegistration --verbose 1 \
                 --dimensionality 3 \
                 --float 0 \
                 --collapse-output-transforms 1 \
                 --output [ output_,output_Warped.nii.gz,output_InverseWarped.nii.gz ] \
                 --interpolation Linear \
                 --use-histogram-matching 0 \
                 --winsorize-image-intensities [ 0.005,0.995 ] \
                 --initial-moving-transform [ $reference,$moving_file,1 ] \
                 --transform Rigid[ 0.1 ] \
                 --metric MI[ $reference,$moving_file,1,32,Regular,0.25 ] \
                 --convergence [ 1000x500x250x0,1e-6,10 ] \
                 --shrink-factors 12x8x4x2 \
                 --smoothing-sigmas 4x3x2x1vox \
                 --transform Affine[ 0.1 ] \
                 --metric MI[ $reference,$moving_file,1,32,Regular,0.25 ] \
                 --convergence [ 1000x500x250x0,1e-6,10 ] \
                 --shrink-factors 12x8x4x2 \
                 --smoothing-sigmas 4x3x2x1vox \
                 --transform SyN[ 0.1,3,0 ] \
                 --metric MI[ $reference,$moving_file,1,32] \
                 --convergence [ 100x100x70x50x0,1e-6,10 ] \
                 --shrink-factors 10x6x4x2x1 \
                 --smoothing-sigmas 5x3x2x1x0vox


# there are two optional calls, if the call above didn't get good performance you could try these two. 
# # 1
# antsRegistration --verbose 1 \
#                  --dimensionality 3 \
#                  --float 1 \
#                  --collapse-output-transforms 1 \
#                  --output [ output_,output_Warped.nii.gz,output_InverseWarped.nii.gz ] \
#                  --interpolation WelchWindowedSinc \
#                  --use-histogram-matching 0 \
#                  --winsorize-image-intensities [ 0.005,0.995 ] \
#                  --initial-moving-transform [ $reference,$moving_file,1 ] \
#                  --transform Rigid[ 0.1 ] \
#                  --metric MI[ $reference,$moving_file,1,32,Regular,0.25 ] \
#                  --convergence [ 1000x500x250x0,1e-6,10 ] \
#                  --shrink-factors 12x8x4x2 \
#                  --smoothing-sigmas 4x3x2x1vox \
#                  --transform Affine[ 0.1 ] \
#                  --metric MI[ $reference,$moving_file,1,32,Regular,0.25 ] \
#                  --convergence [ 1000x500x250x0,1e-6,10 ] \
#                  --shrink-factors 12x8x4x2 \
#                  --smoothing-sigmas 4x3x2x1vox \
#                  --transform SyN[ 0.1,3,0 ] \
#                  --metric CC[ $reference,$moving_file,1,32] \
#                  --convergence [ 100x100x70x50x0,1e-6,10 ] \
#                  --shrink-factors 10x6x4x2x1 \
#                  --smoothing-sigmas 5x3x2x1x0vox

# # 2
# antsRegistration --verbose 1 \
#                  --dimensionality 3 \
#                  --float 1 \
#                  --collapse-output-transforms 1 \
#                  --output [ output_,output_Warped.nii.gz,output_InverseWarped.nii.gz ] \
#                  --interpolation WelchWindowedSinc \
#                  --use-histogram-matching 0 \
#                  --winsorize-image-intensities [ 0.005,0.995 ] \
#                  --initial-moving-transform [ $reference,$moving_file,1 ] \
#                  --transform Rigid[ 0.1 ] \
#                  --metric MI[ $reference,$moving_file,1,32,Regular,0.25 ] \
#                  --convergence [ 1000x500x250x0,1e-8,10 ] \
#                  --shrink-factors 12x8x4x2 \
#                  --smoothing-sigmas 4x3x2x1vox \
#                  --transform Affine[ 0.1 ] \
#                  --metric MI[ $reference,$moving_file,1,32,Regular,0.25 ] \
#                  --convergence [ 1000x500x250x0,1e-8,10 ] \
#                  --shrink-factors 12x8x4x2 \
#                  --smoothing-sigmas 4x3x2x1vox \
#                  --transform SyN[ 0.1,6,0 ] \
#                  --metric CC[ $reference,$moving_file,1,32] \
#                  --convergence [ 100x100x200x200x0,1e-7,10 ] \
#                  --shrink-factors 12x8x4x2x1 \
#                  --smoothing-sigmas 4x3x2x1x0vox

# step2: apply your transformation file to your moving file

antsApplyTransforms --verbose 1 \
                    --dimensionality 3 \
                    --float \ 
                    --interpolation WelchWindowedSinc \
                    --input $moving_file \
                    --reference-image $reference \
                    --output result_warped.nrrd \
                    --transform output_1Warp.nii.gz \
                    --t output_0GenericAffine.mat
