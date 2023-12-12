#!/bin/bash
####################################################################################
#                                                                                  #
# Create Google Cloud project                                                      #
#                                                                                  #
# By Ben Weston                                                                    #
# Version 1.0                                                                      #
# Dec 2023                                                                         #
#                                                                                  #
# USAGE INSTRUCTIONS:                                                              #
#                                                                                  #
# 1. Assumes user is already authenticated to their Google Cloud account           #
# 2. Before you proceed, create a global variable to hold your Google              #
#    Cloud billing account ID.  ie:                                                #
#                                                                                  #
#    export billing_account_id=YOUR-BILLING-ACCOUNT-ID                             #
#                                                                                  #
#    The variable will be referenced in the link_billing function                  #
#    DO NOT HARDCODE YOUR BILLING ACCOUNT!!!                                       #
# 3. Grant execute permissions to file (ie. sudo chmod +x ./project-create.sh)     #
# 4. Run file ./project-create.sh                                                  #
#                                                                                  #
####################################################################################

# Create "project creation" function 
create_project(){
  gcloud projects create $Project_ID \
  --enable-cloud-apis \
  --name "$Project_ID"
}

# Create "set project" function
set_project(){
  gcloud config set project $Project_ID
}

# Create billing link function
link_billing(){
  gcloud billing projects link $Project_ID \
  --billing-account $billing_account_id
}

# Create "Enable Compute Engine APIs" function
enable_apis(){
  echo "Enabling Compute Engine APIs, this may take a short while..." && \
  gcloud services enable compute.googleapis.com
}

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

# Call project creation function
create_project

# Call set project function
set_project

# Call link billing function
link_billing

# Call enable APIs function
enable_apis