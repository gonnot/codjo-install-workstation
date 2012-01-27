OSX Contributor - codjo.net
============================

This project contains all the needed information to contribute to [framework codjo.net](http://codjo.net) in an OSX environement.

# Prerequis

* One mac workstation or laptop :)
* Mac os x - snowleopard or lion

# Install

### Git & Github

* Install GIT from git-scm.com
* Follow github setup guide : http://help.github.com/mac-set-up-git/  

### Codjo Specific stuff

* Declare the maven2 codjo binary repositories : update or create your maven2 ```settings.xml```
  located in ```~/.m2``` (use the template found in this github repository)
* Install the ```codjo.sh``` script in your path

### Tests install

To validate that everything works.

```
. codjo.sh util
mvn install -P codjo
```

# Optionnal Install

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
  ```curl https://raw.github.com/gonnot/codjo-install-osx/master/codjo.sh > ~/.git-completion.sh```

### Codjo completion and alias

Add one alias for calling ```. codjo.sh``` and some auto-completion

* In your .bash_profile

```shell
    function codjo() {
      . codjo.sh $1 $2 $3
    }

    complete -W "administration agent aspect pom test util --help --remove --list gonnot codjo" codjo
```

.