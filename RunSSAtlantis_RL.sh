#!/bin/bash

# find /app/model -type f | xargs dos2unix

#valgrind --log-file=valgrind%p.log --track-origins=yes --leak-check=full --track-fds=yes --show-reachable=yes 

/ocean/rlovindeer/Atlantis/atlantis-trunk/atlantis/atlantismain/atlantisMerged -i SS_init_contam.nc 0 -o outputSalishSea.nc -r SS_run_contam.prm -f SS_forcing_beth.prm -p SS_physics.prm -b 00SS_biology_Beth_Contaminant.prm -s SS_grps.csv -d /ocean/rlovindeer/MOAD/analysis-raisha/SSmodel_outputs/contam_test0

