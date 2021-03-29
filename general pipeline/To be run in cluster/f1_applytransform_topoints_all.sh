cd /media/semmelhacklab/Yuxin/ants_last_try/ants_fish_transformation_file/f1_1130/2d_120
antsApplyTransformsToPoints -d 2 -i centroid_2d_120.csv -o centroid_reg2d_2d_120.csv -t [output_f1_2d_120_0GenericAffine.mat,1]
cd /media/semmelhacklab/Yuxin/ants_last_try/ants_fish_transformation_file/f1_1130/
antsApplyTransformsToPoints -d 3 -i 2d_120/centroid_reg2d_2d_120.csv -o zstack_to_atlas/centroid_reg3d_2d_120.csv -t [zstack_to_atlas/output_whole_f1_0GenericAffine.mat,1] -t zstack_to_atlas/output_whole_f1_1InverseWarp.nii.gz

cd /media/semmelhacklab/Yuxin/ants_last_try/ants_fish_transformation_file/f1_1130/2d_100
antsApplyTransformsToPoints -d 2 -i centroid_2d_100.csv -o centroid_reg2d_2d_100.csv -t [output_f1_2d_100_0GenericAffine.mat,1]
cd /media/semmelhacklab/Yuxin/ants_last_try/ants_fish_transformation_file/f1_1130/
antsApplyTransformsToPoints -d 3 -i 2d_100/centroid_reg2d_2d_100.csv -o zstack_to_atlas/centroid_reg3d_2d_100.csv -t [zstack_to_atlas/output_whole_f1_0GenericAffine.mat,1] -t zstack_to_atlas/output_whole_f1_1InverseWarp.nii.gz

cd /media/semmelhacklab/Yuxin/ants_last_try/ants_fish_transformation_file/f1_1130/2d_80
antsApplyTransformsToPoints -d 2 -i centroid_2d_80.csv -o centroid_reg2d_2d_80.csv -t [output_f1_2d_80_0GenericAffine.mat,1]
cd /media/semmelhacklab/Yuxin/ants_last_try/ants_fish_transformation_file/f1_1130/
antsApplyTransformsToPoints -d 3 -i 2d_80/centroid_reg2d_2d_80.csv -o zstack_to_atlas/centroid_reg3d_2d_80.csv -t [zstack_to_atlas/output_whole_f1_0GenericAffine.mat,1] -t zstack_to_atlas/output_whole_f1_1InverseWarp.nii.gz

cd /media/semmelhacklab/Yuxin/ants_last_try/ants_fish_transformation_file/f1_1130/2d_60
antsApplyTransformsToPoints -d 2 -i centroid_2d_60.csv -o centroid_reg2d_2d_60.csv -t [output_f1_2d_60_0GenericAffine.mat,1]
cd /media/semmelhacklab/Yuxin/ants_last_try/ants_fish_transformation_file/f1_1130/
antsApplyTransformsToPoints -d 3 -i 2d_60/centroid_reg2d_2d_60.csv -o zstack_to_atlas/centroid_reg3d_2d_60.csv -t [zstack_to_atlas/output_whole_f1_0GenericAffine.mat,1] -t zstack_to_atlas/output_whole_f1_1InverseWarp.nii.gz

