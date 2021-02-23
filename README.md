# GitHub Runner Ansible
Playbook to create a GitHub Runner with some supporting tools from the [official VM image](https://github.com/actions/virtual-environments).

# Setup

Update `play.yml` with the following:

```yaml
  environment:
    - PERSONAL_ACCESS_TOKEN: <your-github-token>
    - USER: <github-runner-user>
  vars:
    - github_account: <org-name>

```

Start the install:

```sh
make runner
```

# Credit
* Tool install scripts from [actions/virtual-environments](https://github.com/actions/virtual-environments/tree/main/images/linux/scripts)
