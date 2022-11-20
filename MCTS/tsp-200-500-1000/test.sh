#!/usr/bin/env sh

threads=(4)
GPUNum=(8)
CityNum=(20)
mkdir -p ../results/${CityNum}

for ((j=0;j<$GPUNum;j++));do
{
for ((i=0;i<$threads;i++));do
{
	
	./test $[$[$threads * $j] + $i] ../results/${CityNum}/results_tsp${CityNum}_batch_$[$[$threads * $j] + $i].txt ../instances/tsp${CityNum}_test_concorde.txt ${CityNum} $j

}&
done
wait
}&
done
wait

echo "Done."
