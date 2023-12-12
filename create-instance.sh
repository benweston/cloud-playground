#!/bin/bash
####################################################################################
#                                                                                  #
# Create Google Cloud Compute Engine VM instance                                   #
#                                                                                  #
# By Ben Weston                                                                    #
# Version 1.0                                                                      #
# Dec 2023                                                                         #
#                                                                                  #
# USAGE INSTRUCTIONS:                                                              #
#                                                                                  #
# 1. Assumes user has already created a project by following the                   #
#    project-create.sh script as a previous step                                   #
# 2. Before you proceed, create a global Project_ID variable, which will be        #
#    called in the create_instance function                                        #
# 3. You'll need to obtain your project number; create a 2nd global variable       #
#    for Project_Number, which will be called in the --service-account flag        #
# 4. Grant execute permissions to file (ie. sudo chmod +x ./create-instance.sh)    #
# 5. Run file ./create-instance.sh                                                 #
#                                                                                  #
####################################################################################

# Create "set project" function
set_project(){
  gcloud config set project $Project_ID
}

# Create "instance create" function
create_instance(){
    gcloud compute instances create instance-01 \
    --project=$Project_ID \
    --zone=europe-west2-c \
    --machine-type=e2-medium \
    --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default \
    --maintenance-policy=MIGRATE \
    --provisioning-model=STANDARD \
    --service-account="$Project_Number-compute@developer.gserviceaccount.com" \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
    --create-disk=auto-delete=yes,boot=yes,device-name=instance-01,image=projects/fedora-cloud/global/images/fedora-cloud-base-gcp-38-1-6-x86-64,mode=rw,size=90,type=projects/lpi1-demo-348756/zones/europe-west2-c/diskTypes/pd-ssd \
    --no-shielded-secure-boot \
    --shielded-vtpm \
    --shielded-integrity-monitoring \
    --labels=goog-ec-src=vm_add-gcloud \
    --reservation-affinity=any
}

# Call set project function
set_project

# Call create_instance function
create_instance

    
    
    
    
    
    
    
    
    
    
    
    
    
    