<<<<<<< HEAD
#!/bin/bash
=======
>>>>>>> a64979edfe8013e57a9e2901e97fb3bcf603526a
#from the MOEADD directory: export CLASSPATH=$CLASSPATH:src
#javac src/jmetal/problems/*.java
#javac src/jmetal/problems/ZDT/*.java
#javac src/jmetal/problems/DTLZ/*.java
#javac src/jmetal/problems/WFG/*.java
#javac src/jmetal/metaheuristics/moead/MOEAD_main.java


#problems="dtlz1 dtlz2 dtlz3 dtlz4 dtlz5 dtlz6 dtlz7 wfg1 wfg2 wfg3 wfg4 wfg5 wfg6 wfg7 wfg8 wfg9"
# objectives="2 3 5 8 10 15"


<<<<<<< HEAD
#problems="dtlz1 dtlz2 dtlz3 dtlz4 dtlz5 dtlz6 dtlz7"

problems="wfg1 wfg2 wfg3 wfg4 wfg5 wfg6 wfg7 wfg8 wfg9"
=======
problems="dtlz1"

#problems="wfg1 wfg2 wfg3 wfg4 wfg5 wfg6 wfg7 wfg8 wfg9"
>>>>>>> a64979edfe8013e57a9e2901e97fb3bcf603526a

objectives="2 3 5 8 10 15"


for objective in $objectives; do
	for problem in $problems; do
<<<<<<< HEAD
		
		for ((run=1;run<31;run++)); do
		  echo $problem" - "$objective" - "$run
			java jmetal.metaheuristics.fdea.FDEA_main_cd $problem $objective
			mv FUN0CD "results/fdeacd-$problem-$objective""_solutions.$run.txt"
			mv VAR0CD "results/fdeacd-$problem-$objective""_fronts.$run.txt"
=======
		for ((run=1;run<31;run++)); do

      java jmetal.metaheuristics.fdea.FDEA_main_cd $problem $objective
      mv FUN0CD "results/fdeacd-$problem-$objective""_solutions.$run.txt"
      mv VAR0CD "results/fdeacd-$problem-$objective""_fronts.$run.txt"
>>>>>>> a64979edfe8013e57a9e2901e97fb3bcf603526a

		done
	done
done
echo "PRONTO!"
