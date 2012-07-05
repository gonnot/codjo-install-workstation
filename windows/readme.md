Windows Contributor - codjo.net
============================

This module contains all the needed information to contribute to [framework codjo.net](http://codjo.net) in an Windows environment.

# Prerequisites

* One windows workstation

# Install

### Git & Github

* Install GIT from git-scm.com
* Follow github setup guide : http://help.github.com/win-set-up-git/  

### Git & Github

* Install java jdk5 ou jdk6: http://www.oracle.com/technetwork/java/javasebusiness/downloads/java-archive-downloads-javase5-419410.html
* Install maven (2.0.6 ou 3.x)  : http://archive.apache.org/dist/maven/binaries/maven-2.0.6-bin.zip


### Codjo Specific stuff

* Declare the maven2 codjo binary repositories : update or create your maven2 ```settings.xml```
  located in ```~/.m2``` (use the template found in this github repository)

Git bash enhancement:
* Install ```.bash_profile``` in Windows user profile (e.g. C:\Users\marcona on W7). Change the installation paths in specific functions (jdk15, jdk16, maven2).
* Install the ```codjo.sh``` script in your path and change the CODJO_ROOT in the script with your root
  NB: ```codjo.sh```is the same than the uniw install except the remove function and the clone function (wich uses https protocol instead of git)


### Tests install

To validate that everything works.

```
. codjo.sh util
mvn install -P codjo
```

NB: you may need to install pom in SNAPSHOT version before 
```
codjo pom
mvn install -P codjo
```
 

# Optional Install

### Smart GIT completion

Smart git completion in the terminal. Just have to call the usegit function in a terminal session.

* In your .bash_profile

```shell
    #!/bin/bash
    ...
    function usegit() {
      source ~/.git-completion.sh
      PS1='\h:\W$(__git_ps1 "(%s)")> '
      echo 'Enjoy GIT...'
    }
```

* Add the git completion file in your home folder - .git-completion.sh
  ```curl https://raw.github.com/gonnot/codjo-install-windows/master/codjo.sh > ~/.git-completion.sh```

### Codjo completion and alias

Add one alias for calling ```. codjo.sh``` and some auto-completion

* In your .bash_profile

```shell
    function codjo() {
      . codjo.sh $1 $2 $3
    }

    complete -W "--help --remove --list gonnot codjo agent test util logging xml aspect expression fake-db  jconnect reflect i18n webservices taskpool variable ontology product-ontology ads crypto confluence database database-analyse tokio sql datagen release-test gui-toolkit security mad globs workflow notification administration referential broadcast segmentation historic-audit imports shipment control standalone-common standalone-client" codjo
```

.