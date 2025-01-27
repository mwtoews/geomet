#!/bin/bash

set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
ROOT_DIR=${DIR}/..
function cleanup {
    popd > /dev/null
}
pushd ${ROOT_DIR}
trap cleanup EXIT

pip install -r requirements.txt
python setup.py -q install
# Verify that the `geomet` CLI was installed:
which geomet
# Check the package for publishing suitability:
twine check dist/*
