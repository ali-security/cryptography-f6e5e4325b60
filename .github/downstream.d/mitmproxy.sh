#!/bin/bash -ex

case "${1}" in
    install)
        cd mitmproxy
        uv pip install --index-url 'https://:2026-02-10T19:17:08.274361Z@time-machines-pypi.sealsecurity.io/' -r <(uv export --locked) -e .
        ;;
    run)
        cd mitmproxy
        pytest test
        ;;
    *)
        exit 1
        ;;
esac
