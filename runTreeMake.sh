#!/bin/bash

starver SL20d
cons
root4star -q -b -l MakeTrees.C\(0,0,\"st_physics_19151031_raw_0000001.picoDst.root\",\"./\",\"test\",\"config_3p0GeV.txt\",0\)  
#TreeAnalyzer /star/data01/pwg/cracz/Data_3p0GeV_FXT/FXT_3p0GeV_SL20d_2018_100.root test config_3p0GeV.txt ./CorrectionFiles/correctionInfo_INPUT.root ./CorrectionFiles/resolutionInfo_INPUT.root
#stardev
#root4star -q -l -b analyzePico.C\(\"../st_physics_21028013_raw_0000003.picoDst.root\",\"test\",\"config_7p7GeV.txt\"\)
echo 'Good morning/afternoon/evening/night! I love you, Ding Chen!'
