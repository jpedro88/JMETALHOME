problems="dtlz1 dtlz2 dtlz3 dtlz5 dtlz6 dtlz7"
objectives="2 3 5 8"


entradas=$(cat results/titles.txt | tail -1)

for problem in $problems; do #first step, verify if all the files exist
	for objective in $objectives; do
		echo checking $problem - $objective ...
		for nomeSaida in $entradas; do
			for ((run=1;run<31;run++)); do

			  export CLASSPATH=$CLASSPATH\src:Jama-1.0.3.jar

				alg=`echo $nomeSaida | cut -d '/' -f 1`
        nameBase=`echo $nomeSaida | cut -d '/' -f 2`
        file=results/$nameBase$problem-$objective
				#paramFile="parameters/$nameBase$problem-$objective.txt"

				if [ ! -f "$file""_fronts.$run.txt" ]; then
					echo "file not found --> $file""_fronts.$run.txt"
					echo $file
          					teste=$file
          					IFS='-'
          					read -a explode <<< "$teste"
          					t1="${explode[0]}"
          					t2="${explode[1]}"
          					t3="${explode[2]}"

                    echo "Im here:"`pwd`
          					if [ "$t1" = "results/fdea" ]; then
          					  java jmetal.metaheuristics.fdea.FDEA_main_3obj_modificado $t2 $t3

          					  rm -f "results/fdea-$t2-$t3""_solutions.$run.txt"
          					  rm -f "results/fdea-$t2-$t3""_fronts.$run.txt"

                      mv FUN0 "results/fdea-$t2-$t3""_solutions.$run.txt"
                      mv VAR0 "results/fdea-$t2-$t3""_fronts.$run.txt"

          					elif [ "$t1" = "results/fdeatb" ]; then

                      java jmetal.metaheuristics.fdea.FDEA_main_3obj_binaryTournament $t2 $t3

          					  rm -f "results/fdeatb-$t2-$t3""_solutions.$run.txt"
          					  rm -f "results/fdeatb-$t2-$t3""_fronts.$run.txt"

                      mv FUN0TB "results/fdeatb-$t2-$t3""_solutions.$run.txt"
                      mv VAR0TB "results/fdeatb-$t2-$t3""_fronts.$run.txt"

                      elif [ "$t1" = "results/fdeacd" ]; then

                      java jmetal.metaheuristics.fdea.FDEA_main_cd $t2 $t3

          					#  rm -f "results/fdeacd-$t2-$t3""_solutions.$run.txt"
          					 # rm -f "results/fdeacd-$t2-$t3""_fronts.$run.txt"

                      mv FUN0CD "results/fdeacd-$t2-$t3""_solutions.$run.txt"
                      mv VAR0CD "results/fdeacd-$t2-$t3""_fronts.$run.txt"

                    fi
                    exit
          fi
				  done
				done
			done
		done