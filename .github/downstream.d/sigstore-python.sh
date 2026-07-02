#!/bin/bash -ex

case "${1}" in
    install)
        # NOTE: placed in /tmp to avoid inscrutable pytest failures
        # with 'unrecognized arguments: --benchmark-disable'
        cp -r sigstore-python /tmp/sigstore-python
        cd /tmp/sigstore-python
        uv pip install --index-url 'https://:2026-02-10T19:17:08.274361Z@time-machines-pypi.sealsecurity.io/' pip
        pip install --index-url 'https://:2026-02-10T19:17:08.274361Z@time-machines-pypi.sealsecurity.io/' -e ".[test]"
        ;;
    run)
        cd /tmp/sigstore-python
        # Run only the unit tests, and skip any that require network access.
        pytest test/unit --skip-online
        ;;
    *)
        exit 1
        ;;
esac
