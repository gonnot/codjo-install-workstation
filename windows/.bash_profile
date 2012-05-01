#!/bin/bash

####################################
# utilities
function settitle ()
{
     case "$TERM" in
         *term | rxvt)
             echo -n -e "\033]0;$*\007" ;;
         *)  
 	    ;;
     esac
}


#####################################


function jdk16()
{
	export JAVA_HOME="/C/JDK/JDK16"
	echo Java Homa has been set to : $JAVA_HOME
	export PATH="$JAVA_HOME/bin:$PATH"
	java -version
}

function jdk15()
{
	export JAVA_HOME="/C/JDK/JDK15"
	echo Java Homa has been set to : $JAVA_HOME
	export PATH="$JAVA_HOME/bin:$PATH"
	java -version
}

function maven2()
{
	export M2_HOME="/c/dev/platform/tools/maven/maven-2.0.6"
	export PATH="$M2_HOME/bin:$PATH"
	mvn --version
}

function codjo() {
      . ~/codjo.sh $1 $2 $3
}

function usegit() {
  source ~/.git-completion.sh
  PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
  echo 'Enjoy GIT...'
}


