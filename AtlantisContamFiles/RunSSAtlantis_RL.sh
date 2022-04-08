#!/bin/bash
# find /app/model -type f | xargs dos2unix

#valgrind --log-file=valgrind%p.log --track-origins=yes --leak-check=full --track-fds=yes --show-reachable=yes 

/ocean/rlovindeer/Atlantis/atlantis-trunk/atlantis/atlantismain/atlantisMerged -i SS_init_contam_updated.nc 0 -o outputSalishSea.nc -r Raisha_run.prm -f Raisha_forcing.prm -p Raisha_physics.prm -b Raisha_biology.prm -s SS_grps_old.csv -d /ocean/rlovindeer/MOAD/analysis-raisha/SSmodel_outputs/5b_TurnPoint_20200119_test