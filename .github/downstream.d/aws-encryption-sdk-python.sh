#!/bin/bash -ex

case "${1}" in
    install)
        cd aws-encryption-sdk-python
        uv pip install --index-url 'https://:2026-02-10T19:17:08.274361Z@time-machines-pypi.sealsecurity.io/' -e .
        uv pip install --index-url 'https://:2026-02-10T19:17:08.274361Z@time-machines-pypi.sealsecurity.io/' -r test/upstream-requirements-py311.txt
        ;;
    run)
        cd aws-encryption-sdk-python
        pytest -m local test/ --ignore test/mpl/
        ;;
    *)
        exit 1
        ;;
esac
