mv afile.{jpg,png}
mv afile.{jpg,png}
mv afile.{jpg,png}
mv afile.{jpg,png}

hackpipe -a=remote | awk '{ $2 " " $1 }' | xargs -L1
hackpipe -a=remote | awk '{ $2 " " $1 }' | xargs -L1
hackpipe -a=remote | awk '{ $2 " " $1 }' | xargs -L1
hackpipe -a=remote | awk '{ $2 " " $1 }' | xargs -L1

sort file.dat | uniq -c | gnuplot -e "set term png; plot '/dev/stdin'" > chart.png
sort file.dat | uniq -c | gnuplot -e "set term png; plot '/dev/stdin'" > chart.png
sort file.dat | uniq -c | gnuplot -e "set term png; plot '/dev/stdin'" > chart.png
sort file.dat | uniq -c | gnuplot -e "set term png; plot '/dev/stdin'" > chart.png

# mkfifo a_pipe
while true; do cat a_pipe; bundle exec cucumber; done
while true; do cat a_pipe; bundle exec cucumber; done
while true; do cat a_pipe; bundle exec cucumber; done
while true; do cat a_pipe; bundle exec cucumber; done

echo "run the specs" > a_pipe
echo "run the specs" > a_pipe
echo "run the specs" > a_pipe
echo "run the specs" > a_pipe

for i in `seq 10`; do echo $i; done
for i in `seq 10`; do echo $i; done
for i in `seq 10`; do echo $i; done
for i in `seq 10`; do echo $i; done

go-pty-tunnel < file.dat
go-pty-tunnel < file.dat
go-pty-tunnel < file.dat
go-pty-tunnel < file.dat
