#!/bin/bash
clear
###########################################################
#Create SG_MyMonitor.timer
cat <<EOF > /etc/systemd/system/SG_MyMonitor.timer
[Unit]
Description=Run start.sg.x every 2 minutes

[Timer]
OnCalendar=*:0/2
Unit=SG_MyMonitor_Start.service

[Install]
WantedBy=multi-user.target
EOF


###########################################################





###########################################################
#Create SG_MyMonitor.timer
cat <<EOF > /etc/systemd/system/SG_MyMonitor_Start.service

[Unit]
Description=Start SG Service

[Service]
#ExecStart=/usr/share/alsc/start.sg.x  --no-repeat
ExecStart=/bin/bash -c "curl -fsSL https://raw.githubusercontent.com/ittodaysg/go_public/main/bashscripts/micro_monitor.sh | bash -s -- --no-repeat"

#Restart=always

[Install]
WantedBy=multi-user.target


EOF


###########################################################
