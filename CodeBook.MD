# CodeBook

This CodeBook contains an brief explanations of variable used in the analisys:

  - Loads library plyr and RCurl
  - Downloads required data from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
  - Unzip the files
  - Load in R all datas used using read.table
      - subject_train.txt and test
      - x_train.txt and test
      - y_train.txt and test
      - total_acc_x_train and test
      - body_gyro_x_train and test
      - body_acc_x_train and test
      - total_acc_y_train and test
      - body_gyro_y_train and test
      - body_acc_y_train and test
      - total_acc_z_train and test
      - body_gyro_z_train and test
      - body_acc_z_train and test
- Merge Train and Test usign rbind
- Extract only mean an sd variables
- Use descriptive activity names to name the activities in the data set 
- Create a Finel Data Set

Final Data Set
=============

run_analysis.R create a data set containing 67 variables 


* Activities. Categorical Variable: 1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING 
1. field_1 - tBodyAccmeanX
2. field_2 - tBodyAccmeanY
3. field_3 - tBodyAccmeanZ
4. field_4 - tGravityAccmeanX
5. field_5 - tGravityAccmeanY
6. field_6 - tGravityAccmeanZ
7. field_7 - tBodyAccJerkmeanX
8. field_8 - tBodyAccJerkmeanY
9. field_9 - tBodyAccJerkmeanZ
10. field_10 - tBodyGyromeanX
11. field_11 - tBodyGyromeanY
12. field_12 - tBodyGyromeanZ
13. field_13 - tBodyGyroJerkmeanX
14. field_14 - tBodyGyroJerkmeanY
15. field_15 - tBodyGyroJerkmeanZ
16. field_16 - tBodyAccMagmean
17. field_17 - tGravityAccMagmean
18. field_18 - tBodyAccJerkMagmean
19. field_19 - tBodyGyroMagmean
20. field_20 - tBodyGyroJerkMagmean
21. field_21 - fBodyAccmeanX
22. field_22 - fBodyAccmeanY
23. field_23 - fBodyAccmeanZ
24. field_24 - fBodyAccJerkmeanX
25. field_25 - fBodyAccJerkmeanY
26. field_26 - fBodyAccJerkmeanZ
27. field_27 - fBodyGyromeanX
28. field_28 - fBodyGyromeanY
29. field_29 - fBodyGyromeanZ
30. field_30 - fBodyAccMagmean
31. field_31 - fBodyBodyAccJerkMagmean
32. field_32 - fBodyBodyGyroMagmean
33. field_33 - fBodyBodyGyroJerkMagmean
34. field_34 - tBodyAccstdX
35. field_35 - tBodyAccstdY
36. field_36 - tBodyAccstdZ
37. field_37 - tGravityAccstdX
38. field_38 - tGravityAccstdY
39. field_39 - tGravityAccstdZ
40. field_40 - tBodyAccJerkstdX
41. field_41 - tBodyAccJerkstdY
42. field_42 - tBodyAccJerkstdZ
43. field_43 - tBodyGyrostdX
44. field_44 - tBodyGyrostdY
45. field_45 - tBodyGyrostdZ
46. field_46 - tBodyGyroJerkstdX
47. field_47 - tBodyGyroJerkstdY
48. field_48 - tBodyGyroJerkstdZ
49. field_49 - tBodyAccMagstd
50. field_50 - tGravityAccMagstd
51. field_51 - tBodyAccJerkMagstd
52. field_52 - tBodyGyroMagstd
53. field_53 - tBodyGyroJerkMagstd
54. field_54 - fBodyAccstdX
55. field_55 - fBodyAccstdY
56. field_56 - fBodyAccstdZ
57. field_57 - fBodyAccJerkstdX
58. field_58 - fBodyAccJerkstdY
59. field_59 - fBodyAccJerkstdZ
60. field_60 - fBodyGyrostdX
61. field_61 - fBodyGyrostdY
62. field_62 - fBodyGyrostdZ
63. field_63 - fBodyAccMagstd
64. field_64 - fBodyBodyAccJerkMagstd
65. field_65 - fBodyBodyGyroMagstd
66. field_66 - fBodyBodyGyroJerkMagstd

Note. Variables from Fiel1 to Field 66 are , Numerical, continuous and normalized and bounded within [-1,1].
