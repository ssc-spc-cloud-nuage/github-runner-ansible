# GitHub Runner Ansible
Playbook to create a GitHub Runner with some supporting tools from the [official VM image](https://github.com/actions/virtual-environments).  You can add more tools from the VM image by copying their [install scripts](https://github.com/actions/virtual-environments/tree/main/images/linux/scripts/installers) into the `./roles/install_tools/files/installers` directory.

# Setup

```sh
sudo su -
mkdir actions-runner; cd actions-runner
curl -o actions-runner-linux-x64-2.277.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.277.1/actions-runner-linux-x64-2.277.1.tar.gz
tar xzf ./actions-runner-linux-x64-2.277.1.tar.gz
export RUNNER_ALLOW_RUNASROOT=1
./config.sh --url https://github.com/ssc-spc-cloud-nuage/myssc-drupalwxt --token AGBAUF2S4SPTHL4ARQDJ77TAPELBU
./svc.sh install
./svc.sh start
```

Start the install:

```sh
make runner
```

# Root vs. rootless

It is possible to run the GitHub runner as a non-root use, however this playbook currently installs Docker to run as root.  This will cause problems if your pipelines have a mix of Docker and non-Docker actions.

There are a few options to fix this:

* Run the GitHub runner as root as well.  This is not ideal for security since it means all your pipelines will have root access to the runner VM.
* Use a non-root user for the GitHub runner and setup [rootless Docker](https://github.com/ssc-spc-cloud-nuage/github-runner-ansible/tree/rootless).  There are limitations here as well.  For instance, the following is not possible under rootless Docker `docker run --pid=host` or `docker run --net=host`, but if your pipelines are not complex, you should be fine.

# Docker action speed

If your pipelines have `docker build` or `docker-compose up` actions, make sure the Docker root directory is on fast storage.  The `install_tools` role is setup for Azure VMs which have fast ephemeral storage at `/mnt` and sets this as [Docker's data-root](https://github.com/ssc-spc-cloud-nuage/github-runner-ansible/blob/main/roles/install_tools/files/installers/docker.sh#L10-L11). 

# Credit
* Tool install scripts from [actions/virtual-environments](https://github.com/actions/virtual-environments/tree/main/images/linux/scripts)
