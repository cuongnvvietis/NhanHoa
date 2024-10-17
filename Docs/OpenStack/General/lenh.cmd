Bạn có thể kiểm tra tài nguyên còn lại bằng lệnh:

    openstack hypervisor stats show

Hoặc kiểm tra trạng thái của các máy chủ Compute:

    openstack compute service list
service nova-compute restart
service nova-compute status

service neutron-linuxbridge-agent restart


nano /var/log/nova/nova-scheduler.log    ------controller
nano /var/log/nova/nova-compute.log       ------ compute
nano /var/log/neutron/neutron-server.log
openstack network agent list
