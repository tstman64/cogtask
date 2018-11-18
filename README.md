## cogtask to deploy hello.py flask app

Vagrant file to create 2 Ubuntu 18.04 boxes (master/worker)

master box will host:
- Jenkins
- Docker swarm leader node
- Private docker registery to supply swarm nodes with built images

worker box wil host:
- Docker swarm worker node


Issues: Jenkins container can't run build commands properly
- Possible fix: Install Jenkins with package system instead of container or add slaves to Jenkins to run the job

ToDo:
- Fixing Jenkins container issues
- Adding domain TLS and authentication to the private registery
- Replace master/worker shell scripts with Ansible
- Deploy load balancer node
- Adding Github hooks to activate auto build after commits


