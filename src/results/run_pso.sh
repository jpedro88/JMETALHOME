#from the MOEADD directory: export CLASSPATH=$CLASSPATH:src
#javac src/jmetal/problems/*.java
#javac src/jmetal/problems/ZDT/*.java
#javac src/jmetal/problems/DTLZ/*.java
#javac src/jmetal/problems/WFG/*.java
#javac src/jmetal/metaheuristics/moead/MOEAD_main.java


problems="dtlz1 dtlz2 dtlz3 dtlz4 dtlz5 dtlz6 dtlz7 wfg1 wfg2 wfg3 wfg4 wfg5 wfg6 wfg7 wfg8 wfg9"
# objectives="2 3 5 8 10 15"

# problems="uf1 uf2 uf3 uf4 uf5 uf6 uf7 uf8 uf9 uf10"
objectives="3"


for objective in $objectives; do
	for problem in $problems; do
		for ((run=0;run<30;run++)); do
		
			java jmetal.metaheuristics.moead.MOEAD_main $problem $objective
			mv VAR0 "results/moead-$problem-$objective""_solutions.$run.txt"
			mv FUN0 "results/moead-$problem-$objective""_fronts.$run.txt"
		
		done
	done
done
echo "PRONTO!"

