# Kubeflow kfctl and Kubernetes kubectl CLI in a container
This project builds a Depend-on-Docker container for kfctl and kubectl


# Use
## Interactive
Start a bash shell in the container. kfctl and kubectl are available.

   run.sh bash

   or

   docker run --rm -it iankoulski/kfctl bash

   or

   docker run --rm -it -v $(pwd)/wd:/wd iankoulski/kfctl bash


## Non-interactive
Execute a kubectl or kfctl command 


   Example: docker run --rm -v ~/.kube/config:/root/.kube/config iankoulski/kfctl kubectl info


