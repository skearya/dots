#!/bin/sh
workspaces() {

ws1="1"
ws2="2"
ws3="3"
ws4="4"
ws5="5"
ws6="6"

# Unoccupied
un="0"

# check if Occupied
o1=$(bspc query -D -d .occupied --names | grep "$ws1" )
o2=$(bspc query -D -d .occupied --names | grep "$ws2" )
o3=$(bspc query -D -d .occupied --names | grep "$ws3" )
o4=$(bspc query -D -d .occupied --names | grep "$ws4" )
o5=$(bspc query -D -d .occupied --names | grep "$ws5" )
o6=$(bspc query -D -d .occupied --names | grep "$ws6" )

# check if Focused
f1=$(bspc query -D -d focused --names | grep "$ws1" )
f2=$(bspc query -D -d focused --names | grep "$ws2" )
f3=$(bspc query -D -d focused --names | grep "$ws3" )
f4=$(bspc query -D -d focused --names | grep "$ws4" )
f5=$(bspc query -D -d focused --names | grep "$ws5" )
f6=$(bspc query -D -d focused --names | grep "$ws6" )

f1=$(echo "f${f1}")
f2=$(echo "f${f2}")
f3=$(echo "f${f3}")
f4=$(echo "f${f4}")
f5=$(echo "f${f5}")
f6=$(echo "f${f6}")

ic_1=""
ic_2=""
ic_3=""
ic_4=""
ic_5=""
ic_6=""

echo 	"(box	:class \"works\" :spacing \"-1\" :orientation \"h\" :halign \"center\" :space-evenly \"false\" (button :onclick \"bspc desktop -f $ws1\"	:class	\"$un$o1$f1 first\"	\"$ic_1\") (button :onclick \"bspc desktop -f $ws2\"	:class \"$un$o2$f2\"	 \"$ic_2\") (button :onclick \"bspc desktop -f $ws3\"	:class \"$un$o3$f3\" \"$ic_3\") (button :onclick \"bspc desktop -f $ws4\"	:class \"$un$o4$f4\"	\"$ic_4\") (button :onclick \"bspc desktop -f $ws5\"	:class \"$un$o5$f5\" \"$ic_5\")  (button :onclick \"bspc desktop -f $ws6\"	:class \"$un$o6$f6 last\" \"$ic_6\"))"

}
workspaces
bspc subscribe all | while read -r _ ; do
workspaces
done
