#!/bin/bash -ex

case "${1}" in
    install)
        cd certbot
        uv pip install --index-url 'https://:2026-02-10T19:17:08.274361Z@time-machines-pypi.sealsecurity.io/' pip
        tools/pip_install.py -e ./acme[test]
        tools/pip_install.py -e ./certbot[test]
        uv pip install --index-url 'https://:2026-02-10T19:17:08.274361Z@time-machines-pypi.sealsecurity.io/' -U pyopenssl
        ;;
    run)
        cd certbot
        # Ignore some warnings for now since they're now automatically promoted
        # to errors. We can probably remove this when acme gets split into
        # its own repo
        pytest -Wignore certbot
        pytest acme
        ;;
    *)
        exit 1
        ;;
esac
