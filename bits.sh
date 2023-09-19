#!/bin/bash

printf --  "+------+---------------------+--------------------+------------------+\n"
printf     "|      |        10MHz        |       100MHz       |     1,000MHz     |\n"
printf     "| bits |       days /  years |      days /  years |    days /  years |\n"
printf --  "+------+---------------------+--------------------+------------------+\n"
for (( ii=8 ; ii<=64 ; ii+=8 ))
{
  max=$(echo 2 $ii ^ 60 / 60 / 24 /  pq | dc -)

  mxad=$(echo $max 10000000    / pq | dc -) ; mxay=$(echo $mxad 365 / pq | dc -)
  mxbd=$(echo $max 100000000   / pq | dc -) ; mxby=$(echo $mxbd 365 / pq | dc -)
  mxcd=$(echo $max 1000000000  / pq | dc -) ; mxcy=$(echo $mxcd 365 / pq | dc -)
  mxdd=$(echo $max 10000000000 / pq | dc -) ; mxdy=$(echo $mxdd 365 / pq | dc -)
 
  printf "| %4d" $ii
  printf " | %'10d / %'6d" $mxad $mxay
  printf " | %'9d / %'6d" $mxbd $mxby
  printf " | %'7d / %'6d" $mxcd $mxcy
#  printf " | %'7d / %'6d" $mxdd $mxdy
  printf " |\n"
}
printf --  "+------+---------------------+--------------------+------------------+\n"
