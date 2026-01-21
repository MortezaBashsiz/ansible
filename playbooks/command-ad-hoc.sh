ansible test -a "hostname"
ansible test -a "free -mh"
ansible test -a "df -h"
ansible test -a "date"
ansible test -b -m apt -a "name=ntp state=present"
ansible test -b -m service -a "name=ntp state=started enabled=yes"
ansbile test -b -a "service ntp status"
ansbile test -b -a "service ntp restart" --limit "192.168.173.105"

# Configure the Application Service
ansible test -b -m apt -a "name=python3-mysqldb state=present"
ansible test -b -m apt -a "name=python3-setuptools state=present"
ansible test -b -m easy_install -a "name=django state=present"
ansible test -b -m easy_install -a "name=pip"
ansible test -b -m pip -a "name=django state=present"
ansible test  -a "python3 -c 'import django; print(django.get_version())'"

# Configure the Database Service
ansible test -b -m apt -a "name=mariadb-server state=present"
ansible test -b -m service -a "name=mariadb state=started enabled=yes"
ansible test -b -a "iptables -F"
ansible test -b -a "iptables -A INPUT -s 192.168.173.0/24 -p tcp -m tcp --dport 3336 -j ACCEPT"

ansible test -b -m mysql_user -a "name=django host=% password=12345 priv=*.*:ALL state=present"

# Manage Users ang groups
ansible test -b -m group -a "name=admin state=present"
ansible test -b -m user -a "name=johndoe group=admin createhome=yes generate_ssh_key=yes"
ansible test -b -m user -a "name=johndoe group=admin state=absent remove=yes"

# Manage packages
ansible test -b -m package -a "name=git state=present"

# Manage file and directory
ansible test -b -m stat -a "path=/etc/environment"                                            # Get information about a file
ansible test -m copy -a "src=/etc/hosts dest=/tmp/hosts"                                      # Copy small file to the server, for large use rsync, synchronize
ansible test -m fetch -a "src=/etc/hosts dest=/tmp"
ansible test -m file -a "dest=/tmp/test mode=644 state=directory"                             # Create a dirctory
ansible test -m file -a "dest=/tmp/test state=absent"                                         # Delete a dirctory
ansible test -m file -a "src=/src/symlink dest=/dest/symlink owner=root group=root state=link" # create a symlink

# Manage cron job
ansible test -b -m cron -a "name='daily-cron-all-server' hour=4 job='path/to/daily-script.sh'"
ansible test -b -m cron -a "name='daily-cron-all-server' state=absent"

# Deploy a version controller application
ansible test -b -m git "repo=git://exmaple.com/path/to/repo.git dest=/opt/myapp update=yes version=1.2.4"

