#! /usr/bin/env bash

inmd=`realpath $1`
mdpat='/home/attila/lab-notebook/projects/\([^/]\+\)/_posts/\(.*\)\.md'
project=`sed "s:$mdpat:\1:" <<< $inmd`
post=`sed "s:$mdpat:\2:" <<< $inmd`
Rmd=~/projects/$project/notebook/$post/$post.Rmd
tmp=`mktemp`
cp $Rmd $tmp
sed '/\(layout:\s*\)post/s//\1default/; /{%\s*include/d' $inmd > $Rmd
cat $tmp >> $Rmd && rm $tmp
mv $inmd /tmp/ # backup
vi $Rmd -u NORC -c "set hls" -c 'g/\$/s//$$/gc' && knit $Rmd
