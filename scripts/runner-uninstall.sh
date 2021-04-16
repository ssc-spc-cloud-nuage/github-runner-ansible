set -e # Stop on error
export RUNNER_ALLOW_RUNASROOT=1
cd ~
cd actions-runner
pwd
./svc.sh stop
./svc.sh uninstall
cd ..
rm -r actions-runner
