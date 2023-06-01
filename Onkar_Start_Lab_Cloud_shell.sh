#!/bin/bash
echo -e "Please check if 'diveintoansible-lab' is present at ${HOME} \n"
ls -ltr ${HOME}
if [[ ! -d "$HOME"/diveintoansible-lab ]] ; then
  echo -e " diveintoansible-lab   is NOT PRESENT"
  git clone -b cloudshell-gcp https://github.com/spurin/diveintoansible-lab.git ${HOME}/diveintoansible-lab
  pwd
else
  cd diveintoansible-lab
 
fi
 echo -e " Creating SSH setup using 'ssh-keygen -f ${HOME}/diveintoansible-lab/config/guest_ssh -P "" <<< y; cp -rf ${HOME}/diveintoansible-lab/config/guest_ssh 
  ${HOME}/diveintoansible-lab/config/root_ssh; cp -rf ${HOME}/diveintoansible-lab/config/guest_ssh.pub ${HOME}/diveintoansible-lab/config/root_ssh.pub' \n\n"

  ssh-keygen -f ${HOME}/diveintoansible-lab/config/guest_ssh -P "" <<< y; cp -rf ${HOME}/diveintoansible-lab/config/guest_ssh ${HOME}/diveintoansible-lab/config/root_ssh; \
    cp -rf \
    ${HOME}/diveintoansible-lab/config/guest_ssh.pub \
    ${HOME}/diveintoansible-lab/config/root_ssh.pub

echo -e "Starting dockers ...\n"
cd ${HOME}/diveintoansible-lab;  bin/docker-compose up --quiet-pull
