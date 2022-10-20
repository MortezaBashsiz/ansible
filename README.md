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

For the internal server do the following commands wit correct variables

    echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.d/shaddowsocks_obfs.conf
	sysctl -w net.ipv4.ip_forward=1
	
	iptables -t filter -I INPUT -p tcp -d "$_internalIP" --dport "$_internalPort" -j ACCEPT
	iptables -t filter -I INPUT -p udp -d "$_internalIP" --dport "$_internalPort" -j ACCEPT
	iptables -t filter -I FORWARD -s "$_externalIP" -j ACCEPT
	iptables -t filter -I FORWARD -d "$_externalIP" -j ACCEPT
    iptables -t nat -I POSTROUTING -j MASQUERADE
	iptables -t nat -I PREROUTING -p tcp -d "$_internalIP" --dport "$_internalPort" -j DNAT --to-destination "$_externalIP":"$_externalPort"
	iptables -t nat -I PREROUTING -p udp -d "$_internalIP" --dport "$_internalPort" -j DNAT --to-destination "$_externalIP":"$_externalPort"

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

If you are using another host as your internal server,then do the following commands on internal host wit correct variables

    echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.d/shaddowsocks_obfs.conf
	sysctl -w net.ipv4.ip_forward=1
	
	iptables -t filter -I INPUT -p tcp -d "$_internalIP" --dport "$_internalPort" -j ACCEPT
	iptables -t filter -I INPUT -p udp -d "$_internalIP" --dport "$_internalPort" -j ACCEPT
	iptables -t filter -I FORWARD -s "$_externalIP" -j ACCEPT
	iptables -t filter -I FORWARD -d "$_externalIP" -j ACCEPT
    iptables -t nat -I POSTROUTING -j MASQUERADE
	iptables -t nat -I PREROUTING -p tcp -d "$_internalIP" --dport "$_internalPort" -j DNAT --to-destination "$_externalIP":"$_externalPort"
	iptables -t nat -I PREROUTING -p udp -d "$_internalIP" --dport "$_internalPort" -j DNAT --to-destination "$_externalIP":"$_externalPort"

