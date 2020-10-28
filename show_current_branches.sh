#!/usr/bin/env bash

esm_packages=(esm_tools esm_archiving esm_calendar esm_database esm_environment esm_master esm_parser esm_plugin_manager esm_profile esm_rcfile esm_runscripts esm_version_checker esm_workshop)

# get the directory whe
# esmrc_file="${HOME}/.esmtoolrc" 
# 
# if [ ! -f ${esmrc_file} ]; then
    # echo "esm tools rc file does not exist"
# fi

TOOLS_DIR=/pf/a/a271096/esm_all_packages

# colors 
NORMAL=$(tput sgr0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)

# ===
# loop over the packages 
# ===
for package in ${esm_packages[@]}; do
    # back to the normal color
    color=${NORMAL}

    cd ${TOOLS_DIR}/${package}
    # DEBUG: 
    # echo $PWD
    # echo ""

    # echo "${package}  -->  `git rev-parse --abbrev-ref HEAD`"
    # get the current branch and determine the color
    branch=`git rev-parse --abbrev-ref HEAD`
    if [ ${branch} == "release" ] || [ ${branch} == "master" ]; then
        color=${GREEN}
    elif [ ${branch} == "develop" ]; then
        color=${MAGENTA}
    else
        color=${RED}
    fi
    
    printf "%-20s  --> %s \n"  "${package}" "${color}${branch}${NORMAL}" 
    # for Git v 2.22 or above
    # git branch --show-current

    cd ..
done
