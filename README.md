# Welcome!

This is personal Ansible for setting up and preparing hosts.

# inventory
Edit and customize your inventory file like this. You can see how to put your hosts in different categories 

    ---
    all:
      hosts:
        5.161.142.51:
    
    shadowsocks:
      hosts:
        5.161.142.51:

# playbooks

## init_host.yml
This is the first playbook which will set up and configure very basic things on destination host

	[$]> ansible-playbook  playbooks/init_host.yml


## shadowsocks.yml

This playbook configures the shadowsocks with obfs on destination host

    [$]> ansible-playbook  playbooks/shadowsocks.yml

