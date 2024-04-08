for problem in dtlz1; do
#for problem in dtlz1 dtlz3 dtlz4; do
	./assessment/metrics/juntar_tudo_gd.sh $problem &
	./assessment/metrics/juntar_tudo_igd.sh $problem &
	./assessment/metrics/juntar_tudo_r2.sh $problem &
	./assessment/metrics/juntar_tudo_hv.sh $problem &
done