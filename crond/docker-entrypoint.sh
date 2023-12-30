#!/usr/bin/env bash

set -eu

_main() {
  # if start with an option, prepend args to cronjob
  if [[ "${1:0:1}" = '-' ]]; then
    echo "${CRON_TASK} $* 2>&1 >/var/log/cron.log" > /var/spool/cron/crontabs/root
  else
    echo "${CRON_TASK} 2>&1 >/var/log/cron.log" > /var/spool/cron/crontabs/root
  fi

  if [[ "${1:0:1}" = '-' ]] && [[ "$1" != "*crond" ]]; then
    exec "$@"
  fi

  /usr/sbin/crond -x sch -n -m off
}

_main "$@"
