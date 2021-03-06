#!/usr/bin/env bash

#esm_packages=(esm_environment esm_master esm_parser esm_runscripts)

esm_packages=(esm_archiving esm_calendar esm_database esm_environment esm_master esm_parser esm_plugin_manager esm_profile esm_rcfile esm_runscripts esm_version_checker esm_workshop)

for package in ${esm_packages[@]}; do
    echo =============================================
    echo ${package}
    echo =============================================
    cd ${package}
    git checkout release 
    git pull
    cd ..
    echo
done
