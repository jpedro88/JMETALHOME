algorithms="cmaes-mopso"
problems="dtlz1 dtlz2 dtlz3 dtlz4 wfg1 wfg2 wfg3 wfg4 wfg5 wfg6 wfg7 wfg8 wfg9"
leader="cd"
archiver="cd"
objectives="2 3 5 8 10 15"
clusterings="decision"
truncations="extremes"
distances="euclidean"
weightDistributions="log"
cmaRankings="cd"
solSets="matrix1 matrix2 matrix3 matrix4"
swarmNumbers="1"
partIterations="1"
populations="1"
iterations="-1"
neighborhoodSizes="1"
updateNeighborhoodMetrics="0"

mkdir -p "parameters"
for algorithm in $algorithms; do
	mkdir -p "results/$algorithm/split"
	for objective in $objectives; do
		for problem in $problems; do
			for clustering in $clusterings; do
				for truncation in $truncations; do
					for distance in $distances; do
						for weightDistribution in $weightDistributions; do
							for cmaRanking in $cmaRankings; do
								for solSet in $solSets; do
									for swarmNumber in $swarmNumbers; do
										for partIteration in $partIterations; do
											for population in $populations; do
												for iteration in $iterations; do
													for neighborhoodSize in $neighborhoodSizes; do
														for updateNeighborhoodMetric in $updateNeighborhoodMetrics; do
								
															fileName="$algorithm($solSet)$problem-$objective"
															paramFile="parameters/$fileName.txt"
															output="results/$algorithm/split/$fileName"
															#echo $output
															
															case "$objective" in
																2)
																	iteration=500;
																	;;
																
																3)
																	iteration=1000;
																	;;
																
																5)
																	iteration=1000;
																	;;
																8)
																	iteration=1500;
																	;;
																10)
																	iteration=2000;
																	;;
																15)
																	iteration=3000;
																	;;
																
																*)
																	echo "ERROR, OBJECTIVE NUMBER NOT SET"
																	exit 1
															
															esac

															echo "outName=$output" > $paramFile
															echo "problem=$problem" >> $paramFile
															echo "leader=$leader" >> $paramFile
															echo "archiver=$archiver" >> $paramFile
															echo "objectiveNumber=$objective" >>$paramFile
															echo "population=$population" >> $paramFile
															echo "repository=3" >> $paramFile
															echo "iterations=$iteration" >> $paramFile
															echo "swarms=$swarmNumber" >> $paramFile
															echo "runs=1" >> $paramFile
															echo "algorithm=$algorithm" >> $paramFile
															echo "partIterations=$partIteration" >> $paramFile
															echo "archSubSwarms=pbi" >> $paramFile
															echo "clusteringType=$clustering" >> $paramFile
															echo "truncType=$truncation" >> $paramFile
															echo "clusteringDistance=$distance" >> $paramFile
															echo "weightDistribution=$weightDistribution" >> $paramFile
															echo "cmaRanking=$cmaRanking" >> $paramFile
															echo "solSet=$solSet" >> $paramFile
															echo "subSwarmTotalPopulation=$population" >> $paramFile
															echo "diversityIterations=0" >> $paramFile
															echo "neighborhoodSize=$neighborhoodSize" >> $paramFile
															echo "updateNeighborhoodMetric=$updateNeighborhoodMetric" >> $paramFile
															
															#./mopso.out $paramFile $run
															#echo "./mopso.out $paramFile"
															#qsub qsubScript.sh "\"./mopso.out $paramFile\""
															qsub qsubScript.sh "./mopso.out \"$paramFile\"" $algorithm
															#./qsubScript.sh "./mopso.out \"$paramFile\" $run"
														done
													done
												done
											done
										done
									done
								done
							done
						done
					done
				done
			done
		done
	done
done

algorithms="cmaes-mopso"
problems="dtlz1 dtlz2 dtlz3 dtlz4 wfg1 wfg2 wfg3 wfg4 wfg5 wfg6 wfg7 wfg8 wfg9"
leader="cd"
archiver="cd"
objectives="2 3 5 8 10 15"
clusterings="decision"
truncations="extremes"
distances="euclidean"
weightDistributions="log"
cmaRankings="cd"
solSets="both"
swarmNumbers="1"
partIterations="1"
populations="1"
iterations="-1"
neighborhoodSizes="20"
updateNeighborhoodMetrics="0"

mkdir -p "parameters"
for algorithm in $algorithms; do
	mkdir -p "results/$algorithm/split"
	for objective in $objectives; do
		for problem in $problems; do
			for clustering in $clusterings; do
				for truncation in $truncations; do
					for distance in $distances; do
						for weightDistribution in $weightDistributions; do
							for cmaRanking in $cmaRankings; do
								for solSet in $solSets; do
									for swarmNumber in $swarmNumbers; do
										for partIteration in $partIterations; do
											for population in $populations; do
												for iteration in $iterations; do
													for neighborhoodSize in $neighborhoodSizes; do
														for updateNeighborhoodMetric in $updateNeighborhoodMetrics; do
								
															fileName="$algorithm($solSet)$problem-$objective"
															paramFile="parameters/$fileName.txt"
															output="results/$algorithm/split/$fileName"
															#echo $output
															
															case "$objective" in
																2)
																	iteration=500;
																	;;
																
																3)
																	iteration=1000;
																	;;
																
																5)
																	iteration=1000;
																	;;
																8)
																	iteration=1500;
																	;;
																10)
																	iteration=2000;
																	;;
																15)
																	iteration=3000;
																	;;
																
																*)
																	echo "ERROR, OBJECTIVE NUMBER NOT SET"
																	exit 1
															
															esac

															echo "outName=$output" > $paramFile
															echo "problem=$problem" >> $paramFile
															echo "leader=$leader" >> $paramFile
															echo "archiver=$archiver" >> $paramFile
															echo "objectiveNumber=$objective" >>$paramFile
															echo "population=$population" >> $paramFile
															echo "repository=3" >> $paramFile
															echo "iterations=$iteration" >> $paramFile
															echo "swarms=$swarmNumber" >> $paramFile
															echo "runs=1" >> $paramFile
															echo "algorithm=$algorithm" >> $paramFile
															echo "partIterations=$partIteration" >> $paramFile
															echo "archSubSwarms=pbi" >> $paramFile
															echo "clusteringType=$clustering" >> $paramFile
															echo "truncType=$truncation" >> $paramFile
															echo "clusteringDistance=$distance" >> $paramFile
															echo "weightDistribution=$weightDistribution" >> $paramFile
															echo "cmaRanking=$cmaRanking" >> $paramFile
															echo "solSet=$solSet" >> $paramFile
															echo "subSwarmTotalPopulation=$population" >> $paramFile
															echo "diversityIterations=0" >> $paramFile
															echo "neighborhoodSize=$neighborhoodSize" >> $paramFile
															echo "updateNeighborhoodMetric=$updateNeighborhoodMetric" >> $paramFile
															
															#./mopso.out $paramFile $run
															#echo "./mopso.out $paramFile"
															#qsub qsubScript.sh "\"./mopso.out $paramFile\""
															qsub qsubScript.sh "./mopso.out \"$paramFile\"" $algorithm
															#./qsubScript.sh "./mopso.out \"$paramFile\" $run"
														done
													done
												done
											done
										done
									done
								done
							done
						done
					done
				done
			done
		done
	done
done

algorithms="moead"
problems="dtlz1 dtlz2 dtlz3 dtlz4 wfg1 wfg2 wfg3 wfg4 wfg5 wfg6 wfg7 wfg8 wfg9"
leader="cd"
archiver="cd"
objectives="2 3 5 8 10 15"
clusterings="decision"
truncations="extremes"
distances="euclidean"
weightDistributions="log"
cmaRankings="cd"
solSets="both"
swarmNumbers="1"
partIterations="1"
populations="1"
iterations="-1"
neighborhoodSizes="20"
updateNeighborhoodMetrics="0"

mkdir -p "parameters"
for algorithm in $algorithms; do
	mkdir -p "results/$algorithm/split"
	for objective in $objectives; do
		for problem in $problems; do
			for clustering in $clusterings; do
				for truncation in $truncations; do
					for distance in $distances; do
						for weightDistribution in $weightDistributions; do
							for cmaRanking in $cmaRankings; do
								for solSet in $solSets; do
									for swarmNumber in $swarmNumbers; do
										for partIteration in $partIterations; do
											for population in $populations; do
												for iteration in $iterations; do
													for neighborhoodSize in $neighborhoodSizes; do
														for updateNeighborhoodMetric in $updateNeighborhoodMetrics; do
								
															fileName="$algorithm(DE)$problem-$objective"
															paramFile="parameters/$fileName.txt"
															output="results/$algorithm/split/$fileName"
															#echo $output
															
															case "$objective" in
																2)
																	iteration=500;
																	;;
																
																3)
																	iteration=1000;
																	;;
																
																5)
																	iteration=1000;
																	;;
																8)
																	iteration=1500;
																	;;
																10)
																	iteration=2000;
																	;;
																15)
																	iteration=3000;
																	;;
																
																*)
																	echo "ERROR, OBJECTIVE NUMBER NOT SET"
																	exit 1
															
															esac

															echo "outName=$output" > $paramFile
															echo "problem=$problem" >> $paramFile
															echo "leader=$leader" >> $paramFile
															echo "archiver=$archiver" >> $paramFile
															echo "objectiveNumber=$objective" >>$paramFile
															echo "population=$population" >> $paramFile
															echo "repository=3" >> $paramFile
															echo "iterations=$iteration" >> $paramFile
															echo "swarms=$swarmNumber" >> $paramFile
															echo "runs=1" >> $paramFile
															echo "algorithm=$algorithm" >> $paramFile
															echo "partIterations=$partIteration" >> $paramFile
															echo "archSubSwarms=pbi" >> $paramFile
															echo "clusteringType=$clustering" >> $paramFile
															echo "truncType=$truncation" >> $paramFile
															echo "clusteringDistance=$distance" >> $paramFile
															echo "weightDistribution=$weightDistribution" >> $paramFile
															echo "cmaRanking=$cmaRanking" >> $paramFile
															echo "solSet=$solSet" >> $paramFile
															echo "subSwarmTotalPopulation=$population" >> $paramFile
															echo "diversityIterations=0" >> $paramFile
															echo "neighborhoodSize=$neighborhoodSize" >> $paramFile
															echo "updateNeighborhoodMetric=$updateNeighborhoodMetric" >> $paramFile
															
															#./mopso.out $paramFile $run
															#echo "./mopso.out $paramFile"
															#qsub qsubScript.sh "\"./mopso.out $paramFile\""
															qsub qsubScript.sh "./mopso.out \"$paramFile\""
															#./qsubScript.sh "./mopso.out \"$paramFile\" $run"
														done
													done
												done
											done
										done
									done
								done
							done
						done
					done
				done
			done
		done
	done
done

echo "PRONTO!"

