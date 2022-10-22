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

    v2ray:
      hosts:
        5.161.142.51:
# playbooks

## init_host.yml
This is the first playbook which will set up and configure very basic things on destination host

	[$]> ansible-playbook  playbooks/init_host.yml


## shadowsocks.yml

This playbook configures the shadowsocks with obfs on destination host

    [$]> ansible-playbook  playbooks/shadowsocks.yml

## v2ray.yml

This playbook configures the shadowsocks with obfs on destination host

    [$]> ansible-playbook  playbooks/v2ray.yml

This playbook will print the vmess url in putput which you can use to import 
in your mobile client like as following.

    TASK [v2ray : AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA vmess url AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA] *************
    ok: [65.109.4.91] => {
    "msg": "vmess://eyJ2IjogIjIiLCAicHMOlasdkiOiAiIiwgImFkZCI6ICI2NS4xMDkuNC45MSIsICJwb3J0IjogIjEwMDgxIiwgImlkIjogImM2M2RmMWM0LTljMjEtNTJlNy1hMTBmLTc2ZmM1YmI4NTJiMyIsICJhaWQiOiAiNjQiLCAibmV0IjogInRjcCIsICJ0eXBlIjogIm5vbmUiLCAiaG9zdCI6ICIiLCAicGF0aCI6ICIvIiwgInRscyI6ICJub25lIn0=\n"
    }

Then your url will be 

    vmess://eyJ2IjogIjIiLCAicHMOlasdkiOiAiIiwgImFkZCI6ICI2NS4xMDkuNC45MSIsICJwb3J0IjogIjEwMDgxIiwgImlkIjogImM2M2RmMWM0LTljMjEtNTJlNy1hMTBmLTc2ZmM1YmI4NTJiMyIsICJhaWQiOiAiNjQiLCAibmV0IjogInRjcCIsICJ0eXBlIjogIm5vbmUiLCAiaG9zdCI6ICIiLCAicGF0aCI6ICIvIiwgInRscyI6ICJub25lIn0=


For more informattion take a look to this video 

https://youtu.be/-Ud1xIEpGvc
