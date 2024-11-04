Bạn có thể kiểm tra tài nguyên còn lại bằng lệnh:

    openstack hypervisor stats show

Hoặc kiểm tra trạng thái của các máy chủ Compute:

    openstack compute service list
    service nova-compute restart
    service nova-compute status
Kiểm tra thư mục lưu trữ VM
    Vào container
    /var/lib/nova/instances/
    
service neutron-linuxbridge-agent restart


nano /var/log/nova/nova-scheduler.log    ------controller
nano /var/log/nova/nova-compute.log       ------ compute
nano /var/log/neutron/neutron-server.log
openstack network agent list


-------------------------------------------
Glance
service glance-registry restart
service glance-api restart




cat /var/log/kolla/glance/glance-api.log
python3.10 -m venv /path/to/venv
source /path/to/venv/bin/activate
-----------------------------------



--------------------------------
kolla-ansible -i /etc/kolla/multinode bootstrap-servers
kolla-ansible -i /etc/kolla/multinode prechecks
kolla-ansible -i /etc/kolla/multinode deploy
----------------------------------------



sudo docker stop $(sudo docker ps -aq)
sudo docker rm $(sudo docker ps -aq)
sudo docker rmi -f $(docker images -q)
sudo rm -rf /var/lib/docker


--------------------------------------------------
Hiển thị image ở đâu
openstack image show <image-id>
cd /var/lib/glance/images/
