#!/bin/bash
###
 # Create Google Cloud project
 # 
 # By Ben Weston
 # Version 1.0
 # Dec 2023
 # 
 # USAGE INSTRUCTIONS:
 # 
 # 1. Assumes user is already authenticated to their Google Cloud account
 # 2. Before you proceed, create a global variable to hold your Google
 #    Cloud billing account ID.  ie:
 # 
 #    export billing_account_id=YOUR-BILLING-ACCOUNT-ID
 # 
 #    The variable will be referenced in the link_billing function
 #    DO NOT HARDCODE YOUR BILLING ACCOUNT!!!
 # 3. Grant execute permissions to file
 #    (ie. sudo chmod +x ./project-create.sh)
 # 4. Run file ./project-create.sh
 ##

# Create "project creation" function 
create_project(){
  gcloud projects create $project_id \
  --enable-cloud-apis \
  --name "$project_id"
}

# Create "set project" function
set_project(){
  gcloud config set project $project_id
}

# Create billing link function
link_billing(){
  gcloud billing projects link $project_id \
  --billing-account $billing_account_id
}

# Create "Enable Compute Engine APIs" function
enable_apis(){
  echo "Enabling Compute Engine APIs, this may take a short while..." && \
  gcloud services enable compute.googleapis.com
}

# Create quit program on q function
quit_program(){
  if [ $project_id == 'q' ]
  then
    exit
  fi
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
echo '# ENTER PROJECT NAME (or q to quit program):                                  #'
echo '#                                                                             #'
echo '###############################################################################'

# Prompt for user input
read project_id

# Call quit program on q function
quit_program

# Call project creation function
create_project

# Call set project function
set_project

# Call link billing function
link_billing

# Call enable APIs function
enable_apis