#!/bin/bash
# ######################################################################
#
# Codjo script for OSX (1.5-snapshot)
# --------------------
#
#   See https://github.com/gonnot/codjo-install-osx
#
# ######################################################################

CODJO_ROOT=~/java/codjo
DEFAULT_GITHUB_ACCOUNT=codjo

# ----------------------------------------------------------------------
# Function declaration
# ----------------------------------------------------------------------

# show program usage
show_usage() {
    echo
    echo " Usage:"
    echo "  * to get locally an artifact "
    echo "     codjo <artefact name> [<github account>] "
    echo
    echo "  * to remove local codjo artifact "
    echo "     codjo -r/--remove <artefact name> "
    echo
    echo "  * to list local codjo artifacts "
    echo "     codjo -l/--list"
    echo
}

# change terminal title (or try to...)
function set_title() {
  if [ $1 ]
  then
      export TITLE_PREFIX=$@
  fi
  echo -ne "\033]0;$TITLE_PREFIX \007";
}

# clone an artifact
function clone_artifact() {
    CODJO_ROOT=$1
    ARTIFACT_ID=$2
    GITHUB_ACCOUNT=$3

    if ! [ -d $CODJO_ROOT ]; then mkdir -p $CODJO_ROOT; fi

    if [ -z "$GITHUB_ACCOUNT" ]; then
        GITHUB_ACCOUNT=$DEFAULT_GITHUB_ACCOUNT
    fi

    echo ' '
    echo ' Install '$GITHUB_ACCOUNT'/codjo-'$ARTIFACT_ID locally...
    echo ' '

    cd $CODJO_ROOT
    git clone git@github.com:$GITHUB_ACCOUNT/codjo-$ARTIFACT_ID.git codjo-$ARTIFACT_ID
    cd $CODJO_ROOT/codjo-$ARTIFACT_ID
    git checkout integration
}

# remove local artifact
function remove_artifact() {
    ARTIFACT_ID=$1
    if ! [ -d $CODJO_ROOT/codjo-$ARTIFACT_ID ]; then echo 'codjo-'$ARTIFACT_ID' do not exist in '$CODJO_ROOT; return; fi

    echo ' '
    echo ' Remove '$CODJO_ROOT'/codjo-'$ARTIFACT_ID
    echo ' '

#    rm -Rf $CODJO_ROOT//codjo-$ARTIFACT_ID
    trash $CODJO_ROOT/codjo-$ARTIFACT_ID
}

# list local artifact
function list_artifacts() {
    if ! [ -d $CODJO_ROOT ]; then echo ' No codjo artifacts has been installed yet'; return; fi

    echo
    echo "  Local codjo artifacts:"
    for fn in $CODJO_ROOT/codjo-*; do
      [ -d "$fn" ] && echo ${fn##*/} | cut -d'-' -f2-4 | awk '{print "   - " $0}'
    done
    echo
}

# ----------------------------------------------------------------------
# Main
# ----------------------------------------------------------------------

case $1 in
    # ---------------------------
    # --- Activate help
    # ---------------------------
    ""|"-?"|"-h"|"--help") show_usage
    ;;

    # ---------------------------
    # --- Remove artifact locally
    # ---------------------------
    "-r"|"--remove") remove_artifact $2
    ;;

    # ---------------------------
    # --- List local artifacts
    # ---------------------------
    "-l"|"--list") list_artifacts
    ;;

    # ---------------------------
    # --- Activate artifact
    # ---------------------------
    *)
    # Parameters
    ARTIFACT_ID=$1
    GITHUB_ACCOUNT=$2


    # Check environment and propose to install
    #   - git
    #   - github (with configuration)
    #   - java
    #   - maven
    # tbd

    # Clone repository if necessary
    if ! [ -d $CODJO_ROOT/codjo-$ARTIFACT_ID ]; then
        clone_artifact $CODJO_ROOT $ARTIFACT_ID $GITHUB_ACCOUNT
    fi

    # Set-up env
    set_title codjo-$ARTIFACT_ID
    cd $CODJO_ROOT/codjo-$ARTIFACT_ID

    # Inform user
    echo ' '
    echo ' codjo-'$ARTIFACT_ID' is activated...'
    echo '  -> usegit (for git autocompletion)'
    echo ' '
    ;;
esac

