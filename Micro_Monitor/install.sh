#!/bin/bash
clear
###########################################################
#Create SG_MyMonitor.timer
cat <<EOF > /etc/systemd/system/SG_log.timer
[Unit]
Description=Run start.sg.x every 2 minutes

[Timer]
OnCalendar=*:0/2
Unit=SG_Kog_Start.service

[Install]
WantedBy=multi-user.target
EOF


###########################################################





###########################################################
#Create SG_MyMonitor.timer
cat <<EOF > /etc/systemd/system/SG_Kog_Start.service
[Unit]
Description=Start SG Service

[Service]
ExecStart=/bin/bash -c "curl -fsSL https://raw.githubusercontent.com/ittodaysg/go_public/main/Micro_Monitor/log.sh | bash -s -- --no-repeat"

#Restart=always

[Install]
WantedBy=multi-user.target


EOF
###########################################################



#Run Command
sudo systemctl daemon-reload
sudo systemctl start SG_MyMonitor.timer
sudo systemctl enable SG_MyMonitor.timer




