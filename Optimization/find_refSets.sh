#/bin/bash

#Following line is not used with UVA Rivanna:
#source /etc/profile.d/modules.sh
#Following line is needed to work with UVA Rivanna-specific modules
module load gcc/system openmpi/2.1.5 python/2.7.14

python pareto.py ./DPS/sets/*.set -o 6-9 -e 0.01 0.01 0.001 0.001 --output DPS.resultfile --delimiter=" " --comment="#"
cut -d ' ' -f 7-10 DPS.resultfile >DPS.reference

python pareto.py ./Intertemporal/sets/*.set -o 100-103 -e 0.01 0.01 0.001 0.001 --output Intertemporal.resultfile --delimiter=" " --comment="#"
cut -d ' ' -f 101-104 Intertemporal.resultfile >Intertemporal.reference

python pareto.py ./*.reference -o 0-3 -e 0.01 0.01 0.001 0.001 --output Overall.reference --delimiter=" " --comment="#"