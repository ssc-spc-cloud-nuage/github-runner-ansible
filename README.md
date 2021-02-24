# GitHub Runner Ansible
Playbook to create a GitHub Runner with some supporting tools from the [official VM image](https://github.com/actions/virtual-environments).  You can add more tools from the VM image by copying their [install scripts](https://github.com/actions/virtual-environments/tree/main/images/linux/scripts/installers) into the `./roles/install_tools/files/installers` directory.

# Setup

Update `play.yml` with the following:

```yaml
vars:
  - github_account: <account-name>
  - github_repo: <repo-name>
```

Export your personal access token:

```sh
export PERSONAL_ACCESS_TOKEN=<your-github-token>
```

Start the install:

```sh
make runner
```

# Credit
* Tool install scripts from [actions/virtual-environments](https://github.com/actions/virtual-environments/tree/main/images/linux/scripts)
