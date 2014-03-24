#!/bin/bash - 
#===============================================================================
#
#          FILE: run_tests.sh
# 
#         USAGE: ./run_tests.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 03/12/2014 13:37
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

pushd .
cd ..

sshpass -p 'vagrant' ssh vagrant@33.33.33.10 "cd /vagrant/sra && rake spec"
popd
