# Docker-compose-pull-and-recreate
This script allows you to pull the last images of your stacks and to recreate the containers if necessary.

## Usage

### Download it
Download the script and chmod it.
 
    # wget https://raw.githubusercontent.com/aguyonp/docker-compose-pull-and-recreate/main/pull_and_recreate_stacks.sh

    # chmod +x pull_and_recreate_stacks.sh

### Configure it
Edit the "stack_path" variable with the path where your stacks folders are located.

Example:

    stack=/srv/my_containers

In the folder my_containers you have subfolders:

 - stack1/docker-compose.yml
 - my_reverseproxy/docker-compose.yml
 - and others....

### Execute it
Just make this:

    # ./pull_and_recreate_stacks.sh
    
You can pass confirmations by adding the argument -y

    # ./pull_and_recreate_stacks.sh -y

### Example of execution
![Exemple](https://i.imgur.com/wGrFL73.png)
