sudo mkdir /myagent 
cd /myagent
sudo wget https://vstsagentpackage.azureedge.net/agent/3.220.5/vsts-agent-linux-x64-3.220.5.tar.gz
sudo tar zxvf ./vsts-agent-linux-x64-3.220.5.tar.gz
sudo chmod -R 777 /myagent
runuser -l testadmin -c '/myagent/config.sh --unattended  --url https://dev.azure.com/<MyDevOpsOrg> --auth pat --token <MyDevOpsToken> --pool <MyDevOpsPool>'
sudo /myagent/svc.sh install
sudo /myagent/svc.sh start
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt update
sudo apt install ansible -y
exit 0