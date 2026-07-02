#!/bin/bash -ex

case "${1}" in
    install)
        cd scapy
        uv pip install --index-url 'https://:2026-02-10T19:17:08.274361Z@time-machines-pypi.sealsecurity.io/' tox
        ;;
    run)
        cd scapy
        TOX_OVERRIDE="testenv:cryptography.deps=file://$(realpath ..)" tox -e cryptography
        ;;
    *)
        exit 1
        ;;
esac
