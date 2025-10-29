#!/usr/bin/env sh
gs -q -dNOPAUSE -sDEVICE=pdfwrite -o - "$@"
