set -e # Stop on error
export RUNNER_ALLOW_RUNASROOT=1

read -p "Enter the github repo url [https://github.com/ssc-spc-cloud-nuage/myssc-drupalwxt]: " URL
URL=${URL:-"https://github.com/ssc-spc-cloud-nuage/myssc-drupalwxt"}

read -p "Please enter the token: " TOKEN

cd ~
mkdir actions-runner && cd actions-runner
curl -o actions-runner-linux-x64-2.277.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.277.1/actions-runner-linux-x64-2.277.1.tar.gz
tar xzf ./actions-runner-linux-x64-2.277.1.tar.gz
rm ./actions-runner-linux-x64-2.277.1.tar.gz
./config.sh --url ${URL} --token ${TOKEN}
./svc.sh install
./svc.sh start
