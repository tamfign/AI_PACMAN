﻿(define (problem Pacman_problem)
   (:domain pacman)
   (:objects  s_0_0 s_0_1 s_0_2 s_0_3 s_0_4 s_0_5 s_0_6 s_0_7 s_0_8 s_0_9 s_0_10 s_0_11 s_0_12 s_1_0 s_1_1 s_1_2 s_1_3 s_1_4 s_1_5 s_1_6 s_1_7 s_1_8 s_1_9 s_1_10 s_1_11 s_1_12 s_2_0 s_2_1 s_2_2 s_2_3 s_2_4 s_2_5 s_2_6 s_2_7 s_2_8 s_2_9 s_2_10 s_2_11 s_2_12 s_3_0 s_3_1 s_3_2 s_3_3 s_3_4 s_3_5 s_3_6 s_3_7 s_3_8 s_3_9 s_3_10 s_3_11 s_3_12 p_4_0 p_4_1 p_4_2 p_4_3 p_4_4 p_4_5 s_4_6 s_4_7 s_4_8 s_4_9 s_4_10 s_4_11 s_4_12 s_5_0 s_5_1 s_5_2 s_5_3 s_5_4 s_5_5 s_5_6 s_5_7 s_5_8 s_5_9 s_5_10 s_5_11 s_5_12 s_6_0 s_6_1 s_6_2 s_6_3 s_6_4 s_6_5 s_6_6 s_6_7 s_6_8 s_6_9 s_6_10 s_6_11 s_6_12 s_7_0 s_7_1 s_7_2 s_7_3 s_7_4 s_7_5 s_7_6 s_7_7 s_7_8 s_7_9 s_7_10 s_7_11 s_7_12 s_8_0 s_8_1 s_8_2 s_8_3 s_8_4 s_8_5 s_8_6 s_8_7 s_8_8 s_8_9 s_8_10 s_8_11 s_8_12 s_9_0 s_9_1 s_9_2 s_9_3 s_9_4 s_9_5 s_9_6 s_9_7 s_9_8 s_9_9 s_9_10 s_9_11 s_9_12 s_10_0 s_10_1 s_10_2 s_10_3 s_10_4 s_10_5 s_10_6 s_10_7 s_10_8 s_10_9 s_10_10 s_10_11 s_10_12 s_11_0 s_11_1 s_11_2 s_11_3 s_11_4 s_11_5 s_11_6 s_11_7 s_11_8 s_11_9 s_11_10 s_11_11 s_11_12 s_12_0 s_12_1 s_12_2 s_12_3 s_12_4 s_12_5 s_12_6 s_12_7 s_12_8 s_12_9 s_12_10 s_12_11 s_12_12 s_13_0 s_13_1 s_13_2 s_13_3 s_13_4 s_13_5 s_13_6 s_13_7 s_13_8 s_13_9 s_13_10 s_13_11 s_13_12 s_14_0 s_14_1 s_14_2 s_14_3 s_14_4 s_14_5 s_14_6 s_14_7 s_14_8 s_14_9 s_14_10 s_14_11 s_14_12 s_15_0 s_15_1 s_15_2 s_15_3 s_15_4 s_15_5 s_15_6 s_15_7 s_15_8 s_15_9 s_15_10 s_15_11 s_15_12 s_16_0 s_16_1 s_16_2 s_16_3 s_16_4 s_16_5 s_16_6 s_16_7 s_16_8 s_16_9 s_16_10 s_16_11 s_16_12 s_17_0 s_17_1 s_17_2 s_17_3 s_17_4 s_17_5 s_17_6 s_17_7 s_17_8 s_17_9 s_17_10 s_17_11 s_17_12 s_18_0 s_18_1 s_18_2 s_18_3 s_18_4 s_18_5 s_18_6 s_18_7 s_18_8 s_18_9 s_18_10 s_18_11 s_18_12 s_19_0 s_19_1 s_19_2 s_19_3 s_19_4 s_19_5 s_19_6 s_19_7 s_19_8 s_19_9 s_19_10 s_19_11 s_19_12 s_20_0 s_20_1 s_20_2 s_20_3 s_20_4 s_20_5 s_20_6 s_20_7 s_20_8 s_20_9 s_20_10
              s_20_11 s_20_12 s_21_0 s_21_1 s_21_2 s_21_3 s_21_4 s_21_5 s_21_6 s_21_7 s_21_8 s_21_9 s_21_10 s_21_11 s_21_12 s_22_0 s_22_1 s_22_2 s_22_3 s_22_4 s_22_5 s_22_6 s_22_7 s_22_8 s_22_9 s_22_10 s_22_11 s_22_12 s_23_0 s_23_1 s_23_2 s_23_3 s_23_4 s_23_5 s_23_6 s_23_7 s_23_8 s_23_9 s_23_10 s_23_11 s_23_12 s_24_0 s_24_1 s_24_2 s_24_3 s_24_4 s_24_5 s_24_6 s_24_7 s_24_8 s_24_9 s_24_10 s_24_11 s_24_12 s_25_0 s_25_1 s_25_2 s_25_3 s_25_4 s_25_5 s_25_6 s_25_7 s_25_8 s_25_9 s_25_10 s_25_11 s_25_12 s_26_0 s_26_1 s_26_2 s_26_3 s_26_4 s_26_5 s_26_6 s_26_7 s_26_8 s_26_9 s_26_10 s_26_11 s_26_12 s_27_0 s_27_1 s_27_2 s_27_3 s_27_4 s_27_5 s_27_6 s_27_7 s_27_8 s_27_9 s_27_10 s_27_11 s_27_12 s_28_0 s_28_1 s_28_2 s_28_3 s_28_4 s_28_5 s_28_6 s_28_7 s_28_8 s_28_9 s_28_10 s_28_11 s_28_12 s_29_0 s_29_1 s_29_2 s_29_3 s_29_4 s_29_5 s_29_6 s_29_7 s_29_8 s_29_9 s_29_10 s_29_11 s_29_12 s_30_0 s_30_1 s_30_2 s_30_3 s_30_4 s_30_5 s_30_6 s_30_7 s_30_8 s_30_9 s_30_10 s_30_11 s_30_12 s_31_0 s_31_1 s_31_2 s_31_3 s_31_4 s_31_5 s_31_6 s_31_7 s_31_8 s_31_9 s_31_10 s_31_11 s_31_12 s_32_0 s_32_1 s_32_2 s_32_3 s_32_4 s_32_5 s_32_6 s_32_7 s_32_8 s_32_9 s_32_10 s_32_11 s_32_12 s_33_0 s_33_1 s_33_2 s_33_3 s_33_4 s_33_5 s_33_6 s_33_7 s_33_8 s_33_9 s_33_10 s_33_11 s_33_12 s_34_0 s_34_1 s_34_2 s_34_3 s_34_4 s_34_5 s_34_6 s_34_7 s_34_8 s_34_9 s_34_10 s_34_11 s_34_12 s_35_0 s_35_1 s_35_2 s_35_3 s_35_4 s_35_5 s_35_6 s_35_7 s_35_8 s_35_9 s_35_10 s_35_11 s_35_12 s_36_0 s_36_1 s_36_2 s_36_3 s_36_4 s_36_5 s_36_6 s_36_7 s_36_8 s_36_9 s_36_10 s_36_11 s_36_12 s_37_0 s_37_1 s_37_2 s_37_3 s_37_4 s_37_5 s_37_6 s_37_7 s_37_8 s_37_9 s_37_10 s_37_11 s_37_12 - states)
   (:init 
        (GhostAt s_1_10)
		(CapsuleAt s_36_3)
		(PacmanAt s_36_2)
		(Adjacent s_1_1 s_2_1)
		(Adjacent s_1_1 s_1_2)
		(Adjacent s_1_2 s_1_3)
		(Adjacent s_1_2 s_1_1)
		(Adjacent s_1_3 s_1_4)
		(Adjacent s_1_3 s_1_2)
		(Adjacent s_1_4 s_1_5)
		(Adjacent s_1_4 s_1_3)
		(Adjacent s_1_5 s_1_6)
		(Adjacent s_1_5 s_1_4)
		(Adjacent s_1_6 s_1_7)
		(Adjacent s_1_6 s_1_5)
		(Adjacent s_1_7 s_1_8)
		(Adjacent s_1_7 s_1_6)
		(Adjacent s_1_8 s_1_9)
		(Adjacent s_1_8 s_1_7)
		(Adjacent s_1_9 s_1_10)
		(Adjacent s_1_9 s_1_8)
		(Adjacent s_1_10 s_1_11)
		(Adjacent s_1_10 s_1_9)
		(Adjacent s_1_11 s_1_10)
		(Adjacent s_2_1 s_1_1)
		(Adjacent s_2_1 s_3_1)
		(Adjacent s_3_1 s_2_1)
		(Adjacent s_3_1 s_3_2)
		(Adjacent s_3_2 s_3_3)
		(Adjacent s_3_2 s_3_1)
		(Adjacent s_3_3 s_3_4)
		(Adjacent s_3_3 s_3_2)
		(Adjacent s_3_4 s_3_5)
		(Adjacent s_3_4 s_3_3)
		(Adjacent s_3_5 s_3_6)
		(Adjacent s_3_5 s_3_4)
		(Adjacent s_3_6 s_3_7)
		(Adjacent s_3_6 s_3_5)
		(Adjacent s_3_7 s_3_8)
		(Adjacent s_3_7 s_3_6)
		(Adjacent s_3_8 s_3_9)
		(Adjacent s_3_8 s_3_7)
		(Adjacent s_3_9 s_3_10)
		(Adjacent s_3_9 s_3_8)
		(Adjacent s_3_10 s_3_11)
		(Adjacent s_3_10 s_3_9)
		(Adjacent s_3_11 s_4_11)
		(Adjacent s_3_11 s_3_10)
		(Adjacent s_4_11 s_3_11)
		(Adjacent s_4_11 s_5_11)
		(Adjacent s_5_1 s_6_1)
		(Adjacent s_5_1 s_5_2)
		(Adjacent s_5_2 s_5_3)
		(Adjacent s_5_2 s_5_1)
		(Adjacent s_5_3 s_5_4)
		(Adjacent s_5_3 s_5_2)
		(Adjacent s_5_4 s_5_3)
		(Adjacent s_5_6 s_6_6)
		(Adjacent s_5_6 s_5_7)
		(Adjacent s_5_7 s_5_8)
		(Adjacent s_5_7 s_5_6)
		(Adjacent s_5_8 s_5_9)
		(Adjacent s_5_8 s_5_7)
		(Adjacent s_5_9 s_5_10)
		(Adjacent s_5_9 s_5_8)
		(Adjacent s_5_10 s_5_11)
		(Adjacent s_5_10 s_5_9)
		(Adjacent s_5_11 s_4_11)
		(Adjacent s_5_11 s_5_10)
		(Adjacent s_6_1 s_5_1)
		(Adjacent s_6_1 s_7_1)
		(Adjacent s_6_6 s_5_6)
		(Adjacent s_6_6 s_7_6)
		(Adjacent s_7_1 s_6_1)
		(Adjacent s_7_1 s_8_1)
		(Adjacent s_7_1 s_7_2)
		(Adjacent s_7_2 s_7_3)
		(Adjacent s_7_2 s_7_1)
		(Adjacent s_7_3 s_7_4)
		(Adjacent s_7_3 s_7_2)
		(Adjacent s_7_4 s_8_4)
		(Adjacent s_7_4 s_7_5)
		(Adjacent s_7_4 s_7_3)
		(Adjacent s_7_5 s_7_6)
		(Adjacent s_7_5 s_7_4)
		(Adjacent s_7_6 s_6_6)
		(Adjacent s_7_6 s_7_7)
		(Adjacent s_7_6 s_7_5)
		(Adjacent s_7_7 s_7_8)
		(Adjacent s_7_7 s_7_6)
		(Adjacent s_7_8 s_7_9)
		(Adjacent s_7_8 s_7_7)
		(Adjacent s_7_9 s_8_9)
		(Adjacent s_7_9 s_7_10)
		(Adjacent s_7_9 s_7_8)
		(Adjacent s_7_10 s_7_11)
		(Adjacent s_7_10 s_7_9)
		(Adjacent s_7_11 s_7_10)
		(Adjacent s_8_1 s_7_1)
		(Adjacent s_8_1 s_9_1)
		(Adjacent s_8_4 s_7_4)
		(Adjacent s_8_4 s_9_4)
		(Adjacent s_8_9 s_7_9)
		(Adjacent s_8_9 s_9_9)
		(Adjacent s_9_1 s_8_1)
		(Adjacent s_9_1 s_9_2)
		(Adjacent s_9_2 s_10_2)
		(Adjacent s_9_2 s_9_1)
		(Adjacent s_9_4 s_8_4)
		(Adjacent s_9_4 s_10_4)
		(Adjacent s_9_6 s_9_7)
		(Adjacent s_9_7 s_9_8)
		(Adjacent s_9_7 s_9_6)
		(Adjacent s_9_8 s_9_9)
		(Adjacent s_9_8 s_9_7)
		(Adjacent s_9_9 s_8_9)
		(Adjacent s_9_9 s_9_10)
		(Adjacent s_9_9 s_9_8)
		(Adjacent s_9_10 s_10_10)
		(Adjacent s_9_10 s_9_11)
		(Adjacent s_9_10 s_9_9)
		(Adjacent s_9_11 s_9_10)
		(Adjacent s_10_2 s_9_2)
		(Adjacent s_10_2 s_11_2)
		(Adjacent s_10_4 s_9_4)
		(Adjacent s_10_4 s_11_4)
		(Adjacent s_10_10 s_9_10)
		(Adjacent s_10_10 s_11_10)
		(Adjacent s_11_2 s_10_2)
		(Adjacent s_11_2 s_12_2)
		(Adjacent s_11_4 s_10_4)
		(Adjacent s_11_4 s_11_5)
		(Adjacent s_11_5 s_12_5)
		(Adjacent s_11_5 s_11_6)
		(Adjacent s_11_5 s_11_4)
		(Adjacent s_11_6 s_11_7)
		(Adjacent s_11_6 s_11_5)
		(Adjacent s_11_7 s_11_8)
		(Adjacent s_11_7 s_11_6)
		(Adjacent s_11_8 s_11_7)
		(Adjacent s_11_10 s_10_10)
		(Adjacent s_11_10 s_12_10)
		(Adjacent s_11_10 s_11_11)
		(Adjacent s_11_11 s_12_11)
		(Adjacent s_11_11 s_11_10)
		(Adjacent s_12_2 s_11_2)
		(Adjacent s_12_2 s_13_2)
		(Adjacent s_12_5 s_11_5)
		(Adjacent s_12_5 s_13_5)
		(Adjacent s_12_10 s_11_10)
		(Adjacent s_12_10 s_13_10)
		(Adjacent s_12_10 s_12_11)
		(Adjacent s_12_11 s_11_11)
		(Adjacent s_12_11 s_13_11)
		(Adjacent s_12_11 s_12_10)
		(Adjacent s_13_1 s_13_2)
		(Adjacent s_13_2 s_12_2)
		(Adjacent s_13_2 s_13_3)
		(Adjacent s_13_2 s_13_1)
		(Adjacent s_13_3 s_14_3)
		(Adjacent s_13_3 s_13_4)
		(Adjacent s_13_3 s_13_2)
		(Adjacent s_13_4 s_13_5)
		(Adjacent s_13_4 s_13_3)
		(Adjacent s_13_5 s_12_5)
		(Adjacent s_13_5 s_13_6)
		(Adjacent s_13_5 s_13_4)
		(Adjacent s_13_6 s_13_7)
		(Adjacent s_13_6 s_13_5)
		(Adjacent s_13_7 s_13_8)
		(Adjacent s_13_7 s_13_6)
		(Adjacent s_13_8 s_14_8)
		(Adjacent s_13_8 s_13_9)
		(Adjacent s_13_8 s_13_7)
		(Adjacent s_13_9 s_13_10)
		(Adjacent s_13_9 s_13_8)
		(Adjacent s_13_10 s_12_10)
		(Adjacent s_13_10 s_14_10)
		(Adjacent s_13_10 s_13_11)
		(Adjacent s_13_10 s_13_9)
		(Adjacent s_13_11 s_12_11)
		(Adjacent s_13_11 s_13_10)
		(Adjacent s_14_3 s_13_3)
		(Adjacent s_14_3 s_15_3)
		(Adjacent s_14_8 s_13_8)
		(Adjacent s_14_8 s_15_8)
		(Adjacent s_14_10 s_13_10)
		(Adjacent s_14_10 s_15_10)
		(Adjacent s_15_1 s_16_1)
		(Adjacent s_15_1 s_15_2)
		(Adjacent s_15_2 s_15_3)
		(Adjacent s_15_2 s_15_1)
		(Adjacent s_15_3 s_14_3)
		(Adjacent s_15_3 s_16_3)
		(Adjacent s_15_3 s_15_2)
		(Adjacent s_15_5 s_15_6)
		(Adjacent s_15_6 s_16_6)
		(Adjacent s_15_6 s_15_5)
		(Adjacent s_15_8 s_14_8)
		(Adjacent s_15_10 s_14_10)
		(Adjacent s_15_10 s_16_10)
		(Adjacent s_15_10 s_15_11)
		(Adjacent s_15_11 s_15_10)
		(Adjacent s_16_1 s_15_1)
		(Adjacent s_16_1 s_17_1)
		(Adjacent s_16_3 s_15_3)
		(Adjacent s_16_3 s_17_3)
		(Adjacent s_16_6 s_15_6)
		(Adjacent s_16_6 s_17_6)
		(Adjacent s_16_10 s_15_10)
		(Adjacent s_16_10 s_17_10)
		(Adjacent s_17_1 s_16_1)
		(Adjacent s_17_1 s_18_1)
		(Adjacent s_17_3 s_16_3)
		(Adjacent s_17_3 s_17_4)
		(Adjacent s_17_4 s_18_4)
		(Adjacent s_17_4 s_17_5)
		(Adjacent s_17_4 s_17_3)
		(Adjacent s_17_5 s_18_5)
		(Adjacent s_17_5 s_17_6)
		(Adjacent s_17_5 s_17_4)
		(Adjacent s_17_6 s_16_6)
		(Adjacent s_17_6 s_18_6)
		(Adjacent s_17_6 s_17_5)
		(Adjacent s_17_8 s_17_9)
		(Adjacent s_17_9 s_17_10)
		(Adjacent s_17_9 s_17_8)
		(Adjacent s_17_10 s_16_10)
		(Adjacent s_17_10 s_18_10)
		(Adjacent s_17_10 s_17_11)
		(Adjacent s_17_10 s_17_9)
		(Adjacent s_17_11 s_18_11)
		(Adjacent s_17_11 s_17_10)
		(Adjacent s_18_1 s_17_1)
		(Adjacent s_18_1 s_19_1)
		(Adjacent s_18_4 s_17_4)
		(Adjacent s_18_4 s_18_5)
		(Adjacent s_18_5 s_17_5)
		(Adjacent s_18_5 s_18_6)
		(Adjacent s_18_5 s_18_4)
		(Adjacent s_18_6 s_17_6)
		(Adjacent s_18_6 s_19_6)
		(Adjacent s_18_6 s_18_5)
		(Adjacent s_18_10 s_17_10)
		(Adjacent s_18_10 s_18_11)
		(Adjacent s_18_11 s_17_11)
		(Adjacent s_18_11 s_19_11)
		(Adjacent s_18_11 s_18_10)
		(Adjacent s_19_1 s_18_1)
		(Adjacent s_19_1 s_20_1)
		(Adjacent s_19_1 s_19_2)
		(Adjacent s_19_2 s_20_2)
		(Adjacent s_19_2 s_19_1)
		(Adjacent s_19_6 s_18_6)
		(Adjacent s_19_6 s_20_6)
		(Adjacent s_19_6 s_19_7)
		(Adjacent s_19_7 s_20_7)
		(Adjacent s_19_7 s_19_8)
		(Adjacent s_19_7 s_19_6)
		(Adjacent s_19_8 s_20_8)
		(Adjacent s_19_8 s_19_7)
		(Adjacent s_19_11 s_18_11)
		(Adjacent s_19_11 s_20_11)
		(Adjacent s_20_1 s_19_1)
		(Adjacent s_20_1 s_20_2)
		(Adjacent s_20_2 s_19_2)
		(Adjacent s_20_2 s_21_2)
		(Adjacent s_20_2 s_20_3)
		(Adjacent s_20_2 s_20_1)
		(Adjacent s_20_3 s_20_4)
		(Adjacent s_20_3 s_20_2)
		(Adjacent s_20_4 s_20_3)
		(Adjacent s_20_6 s_19_6)
		(Adjacent s_20_6 s_21_6)
		(Adjacent s_20_6 s_20_7)
		(Adjacent s_20_7 s_19_7)
		(Adjacent s_20_7 s_20_8)
		(Adjacent s_20_7 s_20_6)
		(Adjacent s_20_8 s_19_8)
		(Adjacent s_20_8 s_20_9)
		(Adjacent s_20_8 s_20_7)
		(Adjacent s_20_9 s_21_9)
		(Adjacent s_20_9 s_20_8)
		(Adjacent s_20_11 s_19_11)
		(Adjacent s_20_11 s_21_11)
		(Adjacent s_21_2 s_20_2)
		(Adjacent s_21_2 s_22_2)
		(Adjacent s_21_6 s_20_6)
		(Adjacent s_21_6 s_22_6)
		(Adjacent s_21_9 s_20_9)
		(Adjacent s_21_9 s_22_9)
		(Adjacent s_21_11 s_20_11)
		(Adjacent s_21_11 s_22_11)
		(Adjacent s_22_1 s_22_2)
		(Adjacent s_22_2 s_21_2)
		(Adjacent s_22_2 s_23_2)
		(Adjacent s_22_2 s_22_1)
		(Adjacent s_22_4 s_23_4)
		(Adjacent s_22_6 s_21_6)
		(Adjacent s_22_6 s_22_7)
		(Adjacent s_22_7 s_22_6)
		(Adjacent s_22_9 s_21_9)
		(Adjacent s_22_9 s_23_9)
		(Adjacent s_22_9 s_22_10)
		(Adjacent s_22_10 s_22_11)
		(Adjacent s_22_10 s_22_9)
		(Adjacent s_22_11 s_21_11)
		(Adjacent s_22_11 s_22_10)
		(Adjacent s_23_2 s_22_2)
		(Adjacent s_23_2 s_24_2)
		(Adjacent s_23_4 s_22_4)
		(Adjacent s_23_4 s_24_4)
		(Adjacent s_23_9 s_22_9)
		(Adjacent s_23_9 s_24_9)
		(Adjacent s_24_1 s_25_1)
		(Adjacent s_24_1 s_24_2)
		(Adjacent s_24_2 s_23_2)
		(Adjacent s_24_2 s_25_2)
		(Adjacent s_24_2 s_24_3)
		(Adjacent s_24_2 s_24_1)
		(Adjacent s_24_3 s_24_4)
		(Adjacent s_24_3 s_24_2)
		(Adjacent s_24_4 s_23_4)
		(Adjacent s_24_4 s_24_5)
		(Adjacent s_24_4 s_24_3)
		(Adjacent s_24_5 s_24_6)
		(Adjacent s_24_5 s_24_4)
		(Adjacent s_24_6 s_24_7)
		(Adjacent s_24_6 s_24_5)
		(Adjacent s_24_7 s_25_7)
		(Adjacent s_24_7 s_24_8)
		(Adjacent s_24_7 s_24_6)
		(Adjacent s_24_8 s_24_9)
		(Adjacent s_24_8 s_24_7)
		(Adjacent s_24_9 s_23_9)
		(Adjacent s_24_9 s_24_10)
		(Adjacent s_24_9 s_24_8)
		(Adjacent s_24_10 s_25_10)
		(Adjacent s_24_10 s_24_11)
		(Adjacent s_24_10 s_24_9)
		(Adjacent s_24_11 s_24_10)
		(Adjacent s_25_1 s_24_1)
		(Adjacent s_25_1 s_26_1)
		(Adjacent s_25_1 s_25_2)
		(Adjacent s_25_2 s_24_2)
		(Adjacent s_25_2 s_26_2)
		(Adjacent s_25_2 s_25_1)
		(Adjacent s_25_7 s_24_7)
		(Adjacent s_25_7 s_26_7)
		(Adjacent s_25_10 s_24_10)
		(Adjacent s_25_10 s_26_10)
		(Adjacent s_26_1 s_25_1)
		(Adjacent s_26_1 s_26_2)
		(Adjacent s_26_2 s_25_2)
		(Adjacent s_26_2 s_27_2)
		(Adjacent s_26_2 s_26_1)
		(Adjacent s_26_4 s_26_5)
		(Adjacent s_26_5 s_26_6)
		(Adjacent s_26_5 s_26_4)
		(Adjacent s_26_6 s_26_7)
		(Adjacent s_26_6 s_26_5)
		(Adjacent s_26_7 s_25_7)
		(Adjacent s_26_7 s_26_8)
		(Adjacent s_26_7 s_26_6)
		(Adjacent s_26_8 s_27_8)
		(Adjacent s_26_8 s_26_7)
		(Adjacent s_26_10 s_25_10)
		(Adjacent s_26_10 s_27_10)
		(Adjacent s_27_2 s_26_2)
		(Adjacent s_27_2 s_28_2)
		(Adjacent s_27_8 s_26_8)
		(Adjacent s_27_8 s_28_8)
		(Adjacent s_27_10 s_26_10)
		(Adjacent s_27_10 s_28_10)
		(Adjacent s_28_1 s_28_2)
		(Adjacent s_28_2 s_27_2)
		(Adjacent s_28_2 s_28_3)
		(Adjacent s_28_2 s_28_1)
		(Adjacent s_28_3 s_29_3)
		(Adjacent s_28_3 s_28_4)
		(Adjacent s_28_3 s_28_2)
		(Adjacent s_28_4 s_28_5)
		(Adjacent s_28_4 s_28_3)
		(Adjacent s_28_5 s_28_6)
		(Adjacent s_28_5 s_28_4)
		(Adjacent s_28_6 s_28_5)
		(Adjacent s_28_8 s_27_8)
		(Adjacent s_28_8 s_29_8)
		(Adjacent s_28_10 s_27_10)
		(Adjacent s_28_10 s_28_11)
		(Adjacent s_28_11 s_29_11)
		(Adjacent s_28_11 s_28_10)
		(Adjacent s_29_3 s_28_3)
		(Adjacent s_29_3 s_30_3)
		(Adjacent s_29_8 s_28_8)
		(Adjacent s_29_8 s_30_8)
		(Adjacent s_29_11 s_28_11)
		(Adjacent s_29_11 s_30_11)
		(Adjacent s_30_1 s_30_2)
		(Adjacent s_30_2 s_30_3)
		(Adjacent s_30_2 s_30_1)
		(Adjacent s_30_3 s_29_3)
		(Adjacent s_30_3 s_30_4)
		(Adjacent s_30_3 s_30_2)
		(Adjacent s_30_4 s_30_5)
		(Adjacent s_30_4 s_30_3)
		(Adjacent s_30_5 s_30_6)
		(Adjacent s_30_5 s_30_4)
		(Adjacent s_30_6 s_31_6)
		(Adjacent s_30_6 s_30_7)
		(Adjacent s_30_6 s_30_5)
		(Adjacent s_30_7 s_30_8)
		(Adjacent s_30_7 s_30_6)
		(Adjacent s_30_8 s_29_8)
		(Adjacent s_30_8 s_30_9)
		(Adjacent s_30_8 s_30_7)
		(Adjacent s_30_9 s_30_10)
		(Adjacent s_30_9 s_30_8)
		(Adjacent s_30_10 s_30_11)
		(Adjacent s_30_10 s_30_9)
		(Adjacent s_30_11 s_29_11)
		(Adjacent s_30_11 s_31_11)
		(Adjacent s_30_11 s_30_10)
		(Adjacent s_31_6 s_30_6)
		(Adjacent s_31_6 s_32_6)
		(Adjacent s_31_11 s_30_11)
		(Adjacent s_31_11 s_32_11)
		(Adjacent s_32_1 s_33_1)
		(Adjacent s_32_1 s_32_2)
		(Adjacent s_32_2 s_32_3)
		(Adjacent s_32_2 s_32_1)
		(Adjacent s_32_3 s_32_4)
		(Adjacent s_32_3 s_32_2)
		(Adjacent s_32_4 s_32_5)
		(Adjacent s_32_4 s_32_3)
		(Adjacent s_32_5 s_32_6)
		(Adjacent s_32_5 s_32_4)
		(Adjacent s_32_6 s_31_6)
		(Adjacent s_32_6 s_32_5)
		(Adjacent s_32_8 s_32_9)
		(Adjacent s_32_9 s_32_10)
		(Adjacent s_32_9 s_32_8)
		(Adjacent s_32_10 s_32_11)
		(Adjacent s_32_10 s_32_9)
		(Adjacent s_32_11 s_31_11)
		(Adjacent s_32_11 s_32_10)
		(Adjacent s_33_1 s_32_1)
		(Adjacent s_33_1 s_34_1)
		(Adjacent s_34_1 s_33_1)
		(Adjacent s_34_1 s_34_2)
		(Adjacent s_34_2 s_34_3)
		(Adjacent s_34_2 s_34_1)
		(Adjacent s_34_3 s_34_4)
		(Adjacent s_34_3 s_34_2)
		(Adjacent s_34_4 s_34_5)
		(Adjacent s_34_4 s_34_3)
		(Adjacent s_34_5 s_34_6)
		(Adjacent s_34_5 s_34_4)
		(Adjacent s_34_6 s_34_7)
		(Adjacent s_34_6 s_34_5)
		(Adjacent s_34_7 s_34_8)
		(Adjacent s_34_7 s_34_6)
		(Adjacent s_34_8 s_34_9)
		(Adjacent s_34_8 s_34_7)
		(Adjacent s_34_9 s_34_10)
		(Adjacent s_34_9 s_34_8)
		(Adjacent s_34_10 s_34_11)
		(Adjacent s_34_10 s_34_9)
		(Adjacent s_34_11 s_35_11)
		(Adjacent s_34_11 s_34_10)
		(Adjacent s_35_11 s_34_11)
		(Adjacent s_35_11 s_36_11)
		(Adjacent s_36_1 s_36_2)
		(Adjacent s_36_2 s_36_3)
		(Adjacent s_36_2 s_36_1)
		(Adjacent s_36_3 s_36_4)
		(Adjacent s_36_3 s_36_2)
		(Adjacent s_36_4 s_36_5)
		(Adjacent s_36_4 s_36_3)
		(Adjacent s_36_5 s_36_6)
		(Adjacent s_36_5 s_36_4)
		(Adjacent s_36_6 s_36_7)
		(Adjacent s_36_6 s_36_5)
		(Adjacent s_36_7 s_36_8)
		(Adjacent s_36_7 s_36_6)
		(Adjacent s_36_8 s_36_9)
		(Adjacent s_36_8 s_36_7)
		(Adjacent s_36_9 s_36_10)
		(Adjacent s_36_9 s_36_8)
		(Adjacent s_36_10 s_36_11)
		(Adjacent s_36_10 s_36_9)
		(Adjacent s_36_11 s_35_11)
		(Adjacent s_36_11 s_36_10)
		


    )
   (:goal 
	( and  
		(not (CapsuleAt s_36_3))
		(PacmanAt s_1_10)
		;;(when Powered)
		
		
	
	)
   )

)