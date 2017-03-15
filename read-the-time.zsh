#!/usr/bin/env zsh

# read-the-time.zsh
# 
# This script is (at least I think it is) the ultimate clock-setting
# utility. It reads the time aloud from your Mac, with resolution to the
# second. The vocalized time includes AM/PM, hour, and minute at the
# appropriate times.
# 
# I use this script at _least_ twice a year when we do the quaint 19th century
# tradition of setting clocks forward/back one hour. (I really hate it!)
# 
# Note: this script assumes the computer on which you are running this script
# is synchronized via NTP or some other (is there any other??) time standard.
# 
# 
####################################################################################################
# MIT License
# 
# Copyright (c) 2017 Stefan Wuensch
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
####################################################################################################
# 
# 
# Also note: I wrote this in zsh because I like zsh.  :-)
# You can probably port this to work under bash easily, but I'm not interested
# in doing that myself - at least not right now. (Most Mac OS machines include
# zsh anyway.)
# 
# 


#say "This is `basename $0`."
say "[[ rate +225 ]] It's `date '+%l:%M\ %p'`, [[ rate +85 ]] ahnd?"

export RANDOM=$(( $$ + `date '+%s'` + `ps auxww | cksum | awk '{print $1}'` ))

last=""
rand=$[($RANDOM % 50) +10]
sayings=("I am so tired." "I need to take a break." "I want to take a nap." "This is really boring." "Can I please take a lunch break now?" "Someone please help me." "I hate numbers." "I want to hurt whoever wrote this program." "Please make it stop." "Why are you making me do this?" "Why are you not done yet?" "I feel like I am repeating myself.")
elements=$#sayings
randSaying=$[($RANDOM % $elements) + 1]

while true ; do 
	sec=`date +%S`
	
	[ "$last" -eq "$sec" ] && continue
	if [ $sec -eq 0 ] ; then 
		say "[[ rate +250 ]] It's `date +%l:%M\ %p`."
		sleep 1
		say "[[ rate +125 ]] and now\?"
	elif [ $rand -eq $sec ] ; then
		say "[[ rset 0 ]] $sayings[${randSaying}]"
		sleep 2
		randSaying=$[($RANDOM % $elements) + 1]
		rand=$[($RANDOM % 50) +10]
	elif [ $sec -eq 30 ] && [ "$( date +%M )" = "00" ] ; then
		say "[[ rate +275 ]]`date '+%l:%M %p'\ ahnd\?`"
	elif [ $sec -eq 30 ] ; then
		say "[[ rate +150 ]]`date '+%l:%M'\ ahnd\?`"
	elif [ "`echo $sec | cut -c2`" = "0" ] ; then 
		say "[[ rate +275 ]] $sec seconds."
	elif [ "`echo $sec | cut -c2`" = "5" ] ; then 
		say "[[ rate +250 ]] `echo $sec | tr '0' ' '`."
	elif [ "`echo $sec | cut -c2`" = "7" ] ; then 
		say "[[ rate +250 ]] `echo $sec | tr '0' ' '`."
	elif [ "`echo $sec | cut -c1`" = "0" ] ; then 
		say "[[ rate +250 ]] `echo $sec | cut -c2`."
	else say "[[ rate +225 ]]$sec\?" 
	fi
	last=$sec 
done
