reference=ref_slice.tiff
moving_file=averaged_video.tiff
prefix=f1_2d_output_

antsRegistration --verbose 1 \
                 --dimensionality 2 \
                 --float 0 \]
                 --collapse-output-transforms 1 \
                 --output [$prefix,{$prefix}Warped.nii.gz,{$prefix}output_InverseWarped.nii.gz ] \
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
                
