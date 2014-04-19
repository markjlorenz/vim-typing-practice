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
# mkfifo a_pipe
# mkfifo a_pipe
# mkfifo a_pipe

while true; do cmd=`cat a_pipe`; clear; echo "$cmd"; sh -c "$cmd"; done
while true; do cmd=`cat a_pipe`; clear; echo "$cmd"; sh -c "$cmd"; done
while true; do cmd=`cat a_pipe`; clear; echo "$cmd"; sh -c "$cmd"; done
while true; do cmd=`cat a_pipe`; clear; echo "$cmd"; sh -c "$cmd"; done

echo "bundle exec rspec" > a_pipe
echo "bundle exec rspec" > a_pipe
echo "bundle exec rspec" > a_pipe
echo "bundle exec rspec" > a_pipe

for i in `seq 10`; do echo $i; done
for i in `seq 10`; do echo $i; done
for i in `seq 10`; do echo $i; done
for i in `seq 10`; do echo $i; done

go-pty-tunnel < file.dat
go-pty-tunnel < file.dat
go-pty-tunnel < file.dat
go-pty-tunnel < file.dat
