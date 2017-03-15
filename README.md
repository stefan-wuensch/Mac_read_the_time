# read-the-time.zsh

The ultimate time-setting utility with which your Mac will read the time aloud - so you can set other "dumb" clocks around you.
Don't bother setting mechanical clocks by looking at some other timepiece when your Mac can speak the current time to you!

__Listen to the two sample files to hear how this script sounds!__

This script is (at least I think it is) the ultimate clock-setting
utility. It reads the time aloud from your Mac, with resolution to the
second. The vocalized time includes AM/PM, hour, and minute at the
appropriate times.

I use this script at _least_ twice a year when we do the quaint 19th century
tradition of setting clocks forward/back one hour. (I really hate that!)

Note: this script assumes the computer on which you are running this script
is synchronized via NTP or some other (is there any other??) time standard.

Of course since the Mac OS computer voice is not necessarily going to start and 
finish speaking the current time (not even just the seconds) before one second
has elapsed, this script takes that into account. In other words... no matter 
how long it takes the computer voice to speak the time, the voice will always 
be speaking the current time at that moment. This might mean the computer voice
could jump over a second or two - but that just demonstrates how whatever time 
the computer is speaking is correct. (As long as your computer is correct.)

Also note: I wrote this in zsh because I like zsh.  :-)
You can probably port this to work under bash easily, but I'm not interested
in doing that myself - at least not right now. (Most Mac OS machines include
zsh anyway.)
