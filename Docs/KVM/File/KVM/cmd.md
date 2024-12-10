#!/bin/bash
# CMD log version 3 2022-06-10
# CanhDX Giaohangtietkiem
# canhdx8@ghtk.co 

# Variable
set -e

# Require permission
if [[ "$EUID" -ne 0 ]]; then 
    echo "Please run as root or sudo"
    exit 1
fi

# Check OS
echo "Check Your OS"
if cat /etc/*release | grep Rocky > /dev/null 2>&1; then
    OS="Rocky"
else
    echo "Script doesn't support or verify this OS type/version"
    exit 1
fi 

# Check install rsyslog, logrotate
echo "Check Rsyslog, logrotate installed"
if [[ $OS == "Rocky" ]]; then 
    if ! rpm -qa | grep 'rsyslog\|logrotate' > /dev/null 2>&1; then
        dnf install -y rsyslog logrotate
    fi 
fi

# Check old deploy
echo "Check old cmdlog config"
if [[ -f "/var/log/cmdlog.log" ]]; then 
    echo "Server has been configured with CMD log before. Please check your configuration."
    exit 1
fi 

# Config cmdlog
echo "Configuring cmdlog"
if [[ $OS == "Rocky" ]]; then 
    echo """
    # Command log
    export PROMPT_COMMAND='RETRN_VAL=$?;logger -p local6.debug \"[\$(echo \$SSH_CLIENT | cut -d\" \" -f1)] # \$(history 1 | sed \"s/^[ ]*[0-9]\+[ ]*//\" )\"'
    export HISTTIMEFORMAT='%d/%m/%y %T '""" >> /etc/bashrc
fi 

# Config rsyslog
echo "Configuring rsyslog"
touch /var/log/cmdlog.log
chmod 600 /var/log/cmdlog.log
if [[ $OS == "Rocky" ]]; then 
    chown -R root:root /var/log/cmdlog.log
    echo """
    $RepeatedMsgReduction on
    local6.*                /var/log/cmdlog.log""" >> /etc/rsyslog.conf
fi 

# Config logrotate 
echo "Configuring logrotate"
if [[ $OS == "Rocky" ]]; then 
    echo """
    /var/log/cmdlog.log {
        missingok
        notifempty
        size 10M
        compress
        delaycompress
        copytruncate
        rotate 4
    }""" > /etc/logrotate.d/cmdlog
fi 

# Restart 
echo "Restarting services"
systemctl restart logrotate
systemctl restart rsyslog

echo "DONE - This task requires you to LOGOUT & LOGIN again to start logging commands."
exit
