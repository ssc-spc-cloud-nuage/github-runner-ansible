set -e # Stop on error
export RUNNER_ALLOW_RUNASROOT=1
cd /opt/actions-runner
./svc.sh stop
./svc.sh uninstall
cd /opt
rm -r actions-runner
