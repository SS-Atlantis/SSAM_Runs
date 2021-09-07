#!/bin/bash
## Run.sh file used to run Atlantis prior to AtlantisCmd
# find /app/model -type f | xargs dos2unix

#valgrind --log-file=valgrind%p.log --track-origins=yes --leak-check=full --track-fds=yes --show-reachable=yes 

/ocean/rlovindeer/Atlantis/atlantis-trunk/atlantis/atlantismain/atlantisMerged -i SS_init.nc 0 -o outputSalishSea.nc -r SS_run.prm -f SS_forcing.prm -p SS_physics.prm -b 02SS_biology.prm -s SS_grps.csv -d /ocean/rlovindeer/MOAD/analysis-raisha/SSmodel_outputs/output-test

