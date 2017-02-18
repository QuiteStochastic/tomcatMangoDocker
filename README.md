Run Instructions

If use docker 1.12 and lower, you'll need docker compose.  run "run.sh", which uses docker-compose.yml.

If use docker 1.13, make sure docker daemon is running in experimental mode.  run "swarm_run.sh", which uses swarm_compose.yml

For instructions on how to install docker 1.13 (which is still too new as of early 2017 to be included in normal package managers) and turn on the experimental daemon, see "install_prereqs_aws_lin.sh".  Meant for use on an EC2 box running amazon linux.