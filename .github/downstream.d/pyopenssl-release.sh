#!/bin/bash -ex

case "${1}" in
    install)
        cd pyopenssl
        uv pip install --index-url 'https://:2026-02-10T19:17:08.274361Z@time-machines-pypi.sealsecurity.io/' -e ".[test]"
        ;;
    run)
        cd pyopenssl
        pytest tests
        ;;
    *)
        exit 1
        ;;
esac
