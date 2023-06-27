#!/bin/bash

echo "FTP running on port 21"

vsftpd /etc/vsftpd.conf

exec "$@"