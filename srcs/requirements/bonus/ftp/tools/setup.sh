mkdir -p /var/run/vsftpd/empty
mkdir -p /home/iidkhebb
echo $FTPUSER > /etc/vsftpd.userlist
echo ${FTPUSER}:${FTPPASS} | chpasswd
chown -R ${FTPUSER}:${FTPUSER} /home/"${FTPUSER}"

/usr/sbin/vsftpd /etc/vsftpd.conf
