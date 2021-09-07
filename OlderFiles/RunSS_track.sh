#!/bin/bash
## Script written by Javier to track each run in the log file prior to AtlantisCmd
## automate tracking of prm files
runprm="$1"
root="SS_biology.prm"
## automate backup of log file
biol_prm=$runprm$root
echo $biol_prm
datIni="$(date +'%Y%m%d%H%M%S')"
dateinicio="$(date +'%Y-%m-%d %H:%M:%S')"
SSmodel_outputs="SSmodel_outputs/output$runprm"
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ##
## ~           Run Atlantis Salish Sea       ~ ##
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ##
/ocean/rlovindeer/Atlantis/atlantis-trunk/atlantis/atlantismain/atlantisMerged -i SS_init.nc 0 -o outputSalishSea.nc -r SS_run.prm -f SS_forcing.prm -p SS_physics.prm -b $biol_prm -s SS_grps.csv -d /ocean/rlovindeer/MOAD/analysis-raisha/SSmodel_outputs

echo "++++++++++++++++++++++++++++++++++++++++"
echo "  A Copy of the Log file as been made  "
echo "++++++++++++++++++++++++++++++++++++++++"
datEnd="$(date +'%Y%m%d%H%M%S')"
dateend="$(date +'%Y-%m-%d %H:%M:%S')"
# cp -a $SSmodel_outputs/outputSalishSea.nc SSmodel_outputs/Previous_outputs/Ncout$datEnd.nc
# if [ $(ls SSmodel_outputs/Previous_outputs/*.nc | wc -l) -gt 4 ];
# then
#     rm "$(ls -t SSmodel_outputs/Previous_outputs/*.nc | tail -1)"
#     echo "To save HD space I removed the file created 4 simulation ago"
# fi
echo "...Done"

osver=$(cat /etc/issue.net)

## Writing the information of the run in the RunTrack_RL.txt file
echo "* Run Double Tenor $datIni" >> RunTrack_RL.txt
echo "  - Run start: $dateinicio">> RunTrack_RL.txt
echo "  - Run end: $dateend">> RunTrack_RL.txt
echo "  - OS : $osver">> RunTrack_RL.txt
echo "  - Compiler version : gcc $(gcc -dumpversion)">> RunTrack_RL.txt
echo "  - Bash Version : $BASH_VERSION">> RunTrack_RL.txt
echo "  - Atlantis Version : $(sed -n '2p' < $SSmodel_outputs/log.txt)">> RunTrack_RL.txt
echo "  - Run used :  $(sed -n '14p' < $SSmodel_outputs/log.txt)">> RunTrack_RL.txt

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo " Do you want to do a commit? (Y)ES or (N)OT and press [ENTER]"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
# read answer
# if [ $answer  ==  "Y" -o $answer  ==  "y" ];
# then
#     echo "Enter your comit and the press [ENTER]"
#     read comm
#     read comm2
#     while [[ ! -z "${comm2}" ]]
#     do
# 	comm="$comm\n$comm2"
# 	read comm2
#     done
#     git commit -a -m "$comm"
#     echo " Done!"
# else
    echo " Automatic Git commit was done "
    comm="Automatic backup $datEnd"
    git commit -a -m "$comm"
    echo "Done!"
# fi
echo -e "  - Commit Githhub : $comm">> RunTrack_RL.txt

#echo " - Biomasss Plot">> RunTrack_RL.txt
#Rscript Figures_Save.R $datIni --save
#echo "#+CAPTION: Biomass plot for the simulation $datIni" >> RunTrack_RL.txt
#echo "[[file:/ocean/rlovindeer/MOAD/analysis-raisha/SSmodel_outputs/Previous_outputs/figures/$datIni.png]]">> RunTrack_RL.txt
