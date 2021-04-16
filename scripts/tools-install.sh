set -e # Stop on error
export HELPER_SCRIPTS="/home/azureadmin/github-runner-ansible/roles/install_tools/files/helpers/"

chmod +x /home/azureadmin/github-runner-ansible/roles/install_tools/files/base/
for f in /home/azureadmin/github-runner-ansible/roles/install_tools/files/base/*.sh; do
    # do some stuff here with "$f"
    # remember to quote it or spaces may misbehave
    echo "***"
    echo "Running ${f}"
    echo "***"
    ${f}
done

chmod +x /home/azureadmin/github-runner-ansible/roles/install_tools/files/installers/
for f in /home/azureadmin/github-runner-ansible/roles/install_tools/files/installers/*.sh; do
    # do some stuff here with "$f"
    # remember to quote it or spaces may misbehave
    echo "***"
    echo "Running ${f}"
    echo "***"
    ${f}
done