PS1='\[\e[0;32m\]\u\[\e[m\]@\h\[\e[1;34m\]:\w\[\e[m\]\[\e[1;32m\] \$ \[\e[m\]\[\e[1;37m\]'
alias ls="ls -GF --color"
alias ll="ls -GHalh --color"

#LS_COLORS='di=93:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
LS_COLORS='di=32:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
export LS_COLORS

PATH=~/bin:~/util_script:$PATH
#COLORS-Lscolors
#From: Bartman
#http://linux-sxs.org/housekeeping/lscolors.html
#di = directory
#fi = file
#ln = symbolic link
#pi = fifo file
#so = socket file
#bd = block (buffered) special file
#cd = character (unbuffered) special file
#or = symbolic link pointing to a non-existent file (orphan)
#mi = non-existent file pointed to by a symbolic link (visible when you type ls -l)
#ex = file which is executable (ie. has 'x' set in permissions).

#The *.rpm=90 parameter at the end tells ls to display any files ending in .rpm in the specified colour, in this case colour 90 (dark grey). This can be applied to any types of files (eg. you could use '*.png=35' to make jpeg files appear purple.) As many or as few parameters as you like can go into the LS_COLORS variable, as long as the parameters are separated by colons.

#Using trial and error (and a little bash script I wrote... my first one ever! :) I worked out all the colour codes, at least my interpretation of them -

#0   = default colour
#1   = bold
#4   = underlined
#5   = flashing text
#7   = reverse field
#31  = red
#32  = green
#33  = orange
#34  = blue
#35  = purple
#36  = cyan
#37  = grey
#40  = black background
#41  = red background
#42  = green background
#43  = orange background
#44  = blue background
#45  = purple background
#46  = cyan background
#47  = grey background
#90  = dark grey
#91  = light red
#92  = light green
#93  = yellow
#94  = light blue
#95  = light purple
#96  = turquoise
#100 = dark grey background
#101 = light red background
#102 = light green background
#103 = yellow background
#104 = light blue background
#105 = light purple background
#106 = turquoise background
