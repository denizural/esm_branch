#!/usr/bin/env bash

esm_packages=(esm_environment esm_master esm_parser esm_runscripts)

for package in ${esm_packages[@]}; do
    echo ${package}
    cd ${package}
    git checkout prep_release 
    git pull
    cd ..
done
