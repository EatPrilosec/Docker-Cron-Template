#!/bin/bash


CronCommand="/usr/bin/env"












################################# do not edit if confused ########################################
env >/opt/env
useradd --no-create-home --no-log-init -Uu 1000 --password $RANDOM dockercronjobworker
echo "$CronSchedule sudo -E --group=dockercronjobworker --user=dockercronjobworker $CronCommand >/opt/cron.log 2>/opt/cron.log" >/opt/cron
crontab /opt/cron
touch /opt/cron.log
cron && tail -f /opt/cron.log
