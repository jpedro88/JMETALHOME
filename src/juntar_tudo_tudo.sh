#!/bin/bash
#problems="dtlz1 dtlz2 dtlz3 dtlz4 dtlz5 dtlz6 dtlz7"
problems="dtlz1 dtlz2 dtlz3 dtlz4 dtlz5 dtlz6 dtlz7 wfg1 wfg2 wfg3 wfg4 wfg5 wfg6 wfg7 wfg8 wfg9"

#for problem in problems; do
for problem in dtlz1 dtlz2 dtlz3 dtlz4 dtlz5 dtlz6 dtlz7 wfg1 wfg2 wfg3 wfg4 wfg5 wfg6 wfg7 wfg8 wfg9; do
	#../assessment/metrics/juntar_tudo_gd.sh $problem &
	../assessment/metrics/juntar_tudo_igd.sh $problem &
	#../assessment/metrics/juntar_tudo_r2.sh $problem &
	../assessment/metrics/juntar_tudo_hv.sh $problem &
done
