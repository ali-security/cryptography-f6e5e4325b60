#!/bin/bash -ex

case "${1}" in
    install)
        cd twisted
        uv pip install --index-url 'https://:2026-02-10T19:17:08.274361Z@time-machines-pypi.sealsecurity.io/' ".[all_non_platform]"
        ;;
    run)
        cd twisted
        python -m twisted.trial -j4 src/twisted
        ;;
    *)
        exit 1
        ;;
esac
