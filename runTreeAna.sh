#!/bin/bash

starver SL20d
#cons
#TreeAnalyzer /star/data01/pwg/cracz/Data_3p0GeV_FXT/FXT_3p0GeV_SL20d_2018_100.root test config_3p0GeV.txt ./CorrectionFiles/correctionInfo_INPUT.root ./CorrectionFiles/resolutionInfo_INPUT.root
TreeAnalyzer ./test.root test config_3p0GeV.txt ./CorrectionFiles/correctionInfo_INPUT.root ./CorrectionFiles/resolutionInfo_INPUT.root
#stardev
#root4star -q -l -b analyzePico.C\(\"../st_physics_21028013_raw_0000003.picoDst.root\",\"test\",\"config_7p7GeV.txt\"\)
echo 'Good morning/afternoon/evening/night! I love you, Ding Chen!'
