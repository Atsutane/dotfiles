#!/bin/sh

cp -v systemd/*service systemd/*timer /etc/systemd/system/
systemctl daemon-reload

cd systemd
for f in $(ls *.timer); do systemctl enable $f ; done
cd ..

