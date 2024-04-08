<<<<<<< HEAD
#!/bin/bash
=======
>>>>>>> a64979edfe8013e57a9e2901e97fb3bcf603526a
#problems="dtlz1 dtlz2 dtlz3 dtlz4 wfg1 wfg2 wfg3 wfg4 wfg5 wfg6 wfg7 wfg8 wfg9"
#problems="wfg6 wfg7 wfg8 wfg9"
#objectives="2 3 5 8 10 15"

<<<<<<< HEAD
#problems="dtlz4"
#problems="dtlz1 dtlz2 dtlz3 dtlz4 dtlz5 dtlz6 dtlz7"
#problems="dtlz1 dtlz2 dtlz3 dtlz5 dtlz6 dtlz7"
problems="wfg1 wfg2 wfg3 wfg4 wfg5 wfg6 wfg7 wfg8 wfg9"

objectives="2 3 5 8 10 15"
#objectives="2 3 5"
=======
problems="dtlz1 wfg1"
objectives="2 3 5 8 10"
>>>>>>> a64979edfe8013e57a9e2901e97fb3bcf603526a


entradas=$(cat results/titles.txt | tail -1)

for problem in $problems; do #first step, verify if all the files exist
	for objective in $objectives; do
		echo checking $problem - $objective ...
		for nomeSaida in $entradas; do
			for ((run=1;run<31;run++)); do

				alg=`echo $nomeSaida | cut -d '/' -f 1`
<<<<<<< HEAD
				nameBase=`echo $nomeSaida | cut -d '/' -f 2`
				file=results/$nameBase$problem-$objective
=======
        nameBase=`echo $nomeSaida | cut -d '/' -f 2`
        file=results/$nameBase$problem-$objective
>>>>>>> a64979edfe8013e57a9e2901e97fb3bcf603526a
				#paramFile="parameters/$nameBase$problem-$objective.txt"

				if [ ! -f "$file""_fronts.$run.txt" ]; then
					echo "file not found --> $file""_fronts.$run.txt"
<<<<<<< HEAD
					# exit
=======
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

          					  rm -f "results/fdeacd-$t2-$t3""_solutions.$run.txt"
          					  rm -f "results/fdeacd-$t2-$t3""_fronts.$run.txt"

                      mv FUN0CD "results/fdeacd-$t2-$t3""_solutions.$run.txt"
                      mv VAR0CD "results/fdeacd-$t2-$t3""_fronts.$run.txt"

                      elif [ "$t1" = "results/fdeacdtb" ]; then

                      java jmetal.metaheuristics.fdea.FDEA_main_cdtb $t2 $t3

          					  rm -f "results/fdeacdtb-$t2-$t3""_solutions.$run.txt"
          					  rm -f "results/fdeacdtb-$t2-$t3""_fronts.$run.txt"

                      mv FUN0CDTB "results/fdeacdtb-$t2-$t3""_solutions.$run.txt"
                      mv VAR0CDTB "results/fdeacdtb-$t2-$t3""_fronts.$run.txt"


                    fi
					exit
>>>>>>> a64979edfe8013e57a9e2901e97fb3bcf603526a
# 					echo "running..."
# 					echo "parameters/$nameBase$problem-$objective.txt"
# 					./mopso.out "parameters/$nameBase$problem-$objective.txt"
# 					qsub assessment/other/runQsub.sh "./mopso.out \"$paramFile\" $run"
# 					echo "done."

<<<<<<< HEAD
						teste=$file
						IFS='-'
						read -a explode <<< "$teste"
						t1="${explode[0]}"
						t2="${explode[1]}"
						t3="${explode[2]}"
						

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

							rm -f "results/fdeacd-$t2-$t3""_solutions.$run.txt"
							rm -f "results/fdeacd-$t2-$t3""_fronts.$run.txt"

							mv FUN0CD "results/fdeacd-$t2-$t3""_solutions.$run.txt"
							mv VAR0CD "results/fdeacd-$t2-$t3""_fronts.$run.txt"


            elif [ "$t1" = "results/fdeacdtb" ]; then

              java jmetal.metaheuristics.fdea.FDEA_main_cdtb $t2 $t3

              rm -f "results/fdeacdtb-$t2-$t3""_solutions.$run.txt"
              rm -f "results/fdeacdtb-$t2-$t3""_fronts.$run.txt"
              mv FUN0HV "results/fdeacdtb-$t2-$t3""_solutions.$run.txt"
              mv VAR0HV "results/fdeacdtb-$t2-$t3""_fronts.$run.txt"

            fi
exit
				fi
=======
				elif [ $(cat "$file"_"fronts.$run.txt" | wc -l) -le 3 ]; then # -le less than or equal --- 3, one solution and two blank lines
					echo "file empty or with only one solution --> $file""_fronts.$run.txt"
					echo $file
					teste=$file
					IFS='-'
					read -a explode <<< "$teste"
					t1="${explode[0]}"
					t2="${explode[1]}"
					t3="${explode[2]}"

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

            java java jmetal.metaheuristics.fdea.FDEA_main_cd $t2 $t3

					  rm -f "results/fdeacd-$t2-$t3""_solutions.$run.txt"
					  rm -f "results/fdeacd-$t2-$t3""_fronts.$run.txt"

            mv FUN0CD "results/fdeacd-$t2-$t3""_solutions.$run.txt"
            mv VAR0CD "results/fdeacd-$t2-$t3""_fronts.$run.txt"

            elif [ "$t1" = "results/fdeacdtb" ]; then

            java jmetal.metaheuristics.fdea.FDEA_main_cdtb $t2 $t3

					  rm -f "results/fdeacdtb-$t2-$t3""_solutions.$run.txt"
					  rm -f "results/fdeacdtb-$t2-$t3""_fronts.$run.txt"

            mv FUN0CDTB "results/fdeacdtb-$t2-$t3""_solutions.$run.txt"
            mv VAR0CDTB "results/fdeacdtb-$t2-$t3""_fronts.$run.txt"


          fi
					exit
# 					echo "running..."
# 					echo "parameters/$nameBase$problem-$objective.txt"
# 					./mopso.out "parameters/$nameBase$problem-$objective.txt"
# 					qsub assessment/other/runQsub.sh "./mopso.out \"$paramFile\" $run"
# 					echo "done."
				fi

				#if [ ! -f "$file""_solutions.txt" ]; then
				#	echo "file not found --> $file""_solutions.txt"
				#	#exit
				#	echo "running..."
				#	#echo "parameters/$nameBase$problem-$objective.txt"
				#	./mopso.out "parameters/$nameBase$problem-$objective.txt"
				#	echo "done."
				#fi

# 				if [ $(cat "$file"_"solutions.txt" | wc -l) == 0 ]; then
# 					echo "file empty --> $file""_fronts.txt"
# 					exit
# 				fi

>>>>>>> a64979edfe8013e57a9e2901e97fb3bcf603526a
			done
		done
	done
done

echo "All ok, merging files ..."

for problem in $problems; do #if all is ok, concatenate the files
	for objective in $objectives; do
		echo merging $problem - $objective ...
		for nomeSaida in $entradas; do

			alg=`echo $nomeSaida | cut -d '/' -f 1`
			nameBase=`echo $nomeSaida | cut -d '/' -f 2`
			rm -f results/$alg/$nameBase$problem-$objective""_fronts.txt
			rm -f results/$alg/$nameBase$problem-$objective""_solutions.txt

			for ((run=1;run<31;run++)); do

				file=results/$nameBase$problem-$objective
				#file=results/$alg/split/$nameBase$problem-$objective

				cat $file""_fronts.$run.txt >> results/$nameBase$problem-$objective""_fronts.txt
				cat $file""_solutions.$run.txt >> results/$nameBase$problem-$objective""_solutions.txt

#				echo "" >> results/$alg/$nameBase$problem-$objective""_fronts.txt
#				echo "" >> results/$alg/$nameBase$problem-$objective""_fronts.txt
#				echo "" >> results/$alg/$nameBase$problem-$objective""_solutions.txt
#				echo "" >> results/$alg/$nameBase$problem-$objective""_solutions.txt

				echo "" >> results/$nameBase$problem-$objective""_fronts.txt
<<<<<<< HEAD
    		    echo "" >> results/$nameBase$problem-$objective""_fronts.txt
        		echo "" >> results/$nameBase$problem-$objective""_solutions.txt
        		echo "" >> results/$nameBase$problem-$objective""_solutions.txt
=======
        echo "" >> results/$nameBase$problem-$objective""_fronts.txt
        echo "" >> results/$nameBase$problem-$objective""_solutions.txt
        echo "" >> results/$nameBase$problem-$objective""_solutions.txt
>>>>>>> a64979edfe8013e57a9e2901e97fb3bcf603526a
			done
# 			echo results/$alg/$nameBase$problem-$objective
		done
	done
<<<<<<< HEAD
done
=======
done
>>>>>>> a64979edfe8013e57a9e2901e97fb3bcf603526a
