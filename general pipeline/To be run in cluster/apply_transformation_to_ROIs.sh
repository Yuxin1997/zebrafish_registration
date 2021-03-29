prefix2d=f1_2d_output_
prefix3d=fish1_output_


antsApplyTransformsToPoints -d 2 -i example_coordinates.csv -o example_coordinates_reg2d.csv -t [{$prefix2d}0GenericAffine.mat,1]
antsApplyTransformsToPoints -d 3 -i example_coordinates_reg2d.csv -o example_coordinates_reg.csv -t [{$prefix3d}0GenericAffine.mat,1] -t {$prefix3d}1InverseWarp.nii.gz
