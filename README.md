# Docker-compose-pull-and-recreate
This script allows you to pull the last images of your stacks and to recreate the containers if necessary.

## Usage

### Download it
Download the script and execute it.

    # chmod +x pull_and_recreate_stacks.sh
    # ./pull_and_recreate_stacks.sh

### Configure it
Edit the "stack_path" variable with the path where your stacks folders are located.

Example:

    stack=/srv/my_containers

In the folder my_containers you have subfolders:

 - stack1/docker-compose.yml
 - my_reverseproxy/docker-compose.yml
 - and others....

### Execute it
You can pass confirmations by adding the argument -y
	

    # ./pull_and_recreate_stacks.sh -y

