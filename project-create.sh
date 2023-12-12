#!/bin/bash
####################################################################################
#                                                                                  #
# Create Google Cloud project                                                      #
#                                                                                  #
# By Ben Weston                                                                    #
# Version 1.0                                                                      #
# Dec 2023                                                                         #
#                                                                                  #
# Usage instructions:                                                              #
# 1. Assumes user is already authenticated to their Google Cloud account           #
# 2. Grant execute permissions to file (ie. sudo chmod +x ./project-create)        #
# 3. Run file ./project-create                                                     #
#                                                                                  #
####################################################################################

# Greet user
clear && \
echo '###############################################################################'
echo '#                                                                             #'
echo '# Welcome!  The following action will create a project                        #'
echo '# in your Google Cloud account.  Please enter the name                        #'
echo '# you wish to give the project                                                #'
echo '#                                                                             #'
echo '# (Project ID can have lowercase letters, digits or hyphens).                 #'
echo '# (It must start with a lowercase letter and end with a letter or number).    #'
echo '#                                                                             #'
echo '# ENTER PROJECT NAME:                                                         #'
echo '#                                                                             #'
echo '###############################################################################'

# Prompt for user input
read Project_ID

# Create function; call function
create_project () {
  gcloud projects create $Project_ID \
  --enable-cloud-apis \
  --name "$Project_ID"
}

create_project