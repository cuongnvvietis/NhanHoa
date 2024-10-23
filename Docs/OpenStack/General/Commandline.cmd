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


-------------------------------------------
Glance
service glance-registry restart
service glance-api restart




cat /var/log/kolla/glance/glance-api.log
python3.10 -m venv /path/to/venv
source /path/to/venv/bin/activate
-----------------------------------
1. Xóa tham chiếu OVN và OVS trong globals.yml
Mở file globals.yml:
bash
Copy code
nano /etc/kolla/globals.yml
Tìm và kiểm tra các tham số liên quan đến OVN và OVS, chẳng hạn như:

neutron_plugin_agent
neutron_enable_ovn_agent
enable_ovn
Đảm bảo rằng tất cả các tham số liên quan đến OVN và OVS được cấu hình như sau:

yaml
Copy code
neutron_plugin_agent: "linuxbridge"
neutron_enable_ovn_agent: "no"
enable_ovn: "no"
Lưu file và thoát khỏi nano:
bash
Copy code
Ctrl + O (để lưu)
Ctrl + X (để thoát)
2. Xóa các file và block cấu hình OVN trong vai trò Ansible
Tiếp theo, bạn cần xóa các tham chiếu đến OVN trong các file nhiệm vụ (tasks) của Ansible.

Đi tới thư mục neutron trong roles:

bash
Copy code
cd /path/to/venv/share/kolla-ansible/ansible/roles/neutron/tasks
Mở các file cấu hình mà bạn đã tìm thấy thông qua grep, chẳng hạn như config.yml, và tìm kiếm tất cả các block có liên quan đến OVN và OVS, ví dụ:
bash
Copy code
nano config.yml
Tìm các block liên quan đến OVN, ví dụ:
yaml
Copy code
'neutron-ovn-agent': {
    'container_name': 'neutron_ovn_agent',
    'enabled': '{{ neutron_enable_ovn_agent | bool }}',
    'volumes': '{{ neutron_ovn_agent_default_volumes + neutron_ovn_agent_extra_volumes }}',
    'healthcheck': '{{ neutron_ovn_agent_healthcheck }}'
}
Xóa các block này hoàn toàn hoặc tắt chúng bằng cách đặt enabled: false:
yaml
Copy code
'neutron-ovn-agent': {
    'enabled': false
}
Lưu file và tiếp tục thực hiện với các file khác nếu có (ví dụ neutron/containers.yml, neutron/handlers/main.yml).
3. Xóa các file không cần thiết liên quan đến OVN và OVS
Đi tới thư mục chứa vai trò Ansible của neutron và kiểm tra các file không cần thiết:
bash
Copy code
cd /path/to/venv/share/kolla-ansible/ansible/roles/neutron/
Xóa các file liên quan đến OVN và OVS nếu chúng tồn tại, chẳng hạn như:
bash
Copy code
rm -rf ovn-controller/ ovn-db/ openvswitch/
Sau khi xóa các file không cần thiết, quay lại thư mục chính và kiểm tra lại các file khác.
---------------------------------
[control]
controller01 ansible_ssh_user=cuongnv ansible_become=True

[network]
controller01 ansible_ssh_user=cuongnv ansible_become=True

[compute]
compute01 ansible_ssh_user=cuongnv ansible_become=True

[monitoring]

[storage]
block01 ansible_ssh_user=cuongnv ansible_become=True

[deployment]
localhost ansible_connection=local
--------------------------------
kolla-ansible -i /etc/kolla/multinode bootstrap-servers
kolla-ansible -i /etc/kolla/multinode prechecks
kolla-ansible -i /etc/kolla/multinode deploy
