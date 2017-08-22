#!/bin/bash -x

anadea.dokku.main() {
  [[ -z ${APP_DOMAIN} ]] || exec ssh -t dokku@${APP_DOMAIN} -- $@
}