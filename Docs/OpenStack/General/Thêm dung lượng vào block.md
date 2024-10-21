pvcreate /dev/vdb
vgextend cinder-volumes /dev/vdb
lvextend /dev/cinder-volumes/cinder-volumes-pool /dev/vdb

Trên server block chạy câu lệnh sau
service tgt restart
service cinder-volume restart

Trên server controller chạy các lệnh sau
service nova-api restart
service cinder-scheduler restart

