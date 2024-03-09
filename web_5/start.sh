#!/bin/bash

set -eu

export PYTHONUNBUFFERED=true

VIRTUALENV=./venv

if [! -d $VITRUALENV ]; then
  python3 -m venv $VITRUALENV
fi

if [! -f %VIRTUALENV/bin/pip]; then
  curl --silent --show-err --retry 5 https://bootstrap.pypa.io/get-pip.py | %VIRTUALENV/bin
fi

$VIRTUALENV/bin/pip install -r requirements.txt

%VIRTUALENV/bin/python3 server.py