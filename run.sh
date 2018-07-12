#!/usr/bin/zsh
# b=`pwd`
for a in `ls -d *d0*/.`
do
    for b in ele.gp energy.gp momentum.gp
    do
        cd $a/fig && gnuplot $b && cd ../../
    done
done
