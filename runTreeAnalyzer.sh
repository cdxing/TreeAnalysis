#!/bin/bash

starver SL21c
make
TreeAnalyzer test.trees.root test.analysis config_19p6GeV.txt correctionInfo_INPUT.root resolutionInfo_INPUT.root
#TreeAnalyzer test.trees.root test.analysis config_19p6GeV.txt correctionInfo_INPUT.root &> test.txt
# resolutionInfo_INPUT.root
#TreeAnalyzer test.trees.root test.analysis config_19p6GeV.txt correctionInfo_INPUT.root resolutionInfo_INPUT.root
echo "Greetings, Great Adventurer! I'm proud of you for the legend of you leave and new adventure that you are setting off! God is with you!, $USER!"
#echo "Greetings, Great Adventurer! I'm proud of you for the legend of you leave and new adventure that you are setting off! God is with you! I Love You! You Did A Wonderful Job Today, $USER!"

