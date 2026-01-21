ansible-playbook playbook.yml --limit webservers        # limit particular host and group
ansible-playbook playbook.yml --limit xyz.example.com   # Limit on particular host
ansible-playbook playbook.yml --list-hosts              # List affected host
ansible-playbook playbook.yml --remote-user=johndoe     # remote play user
ansible-playbook playbook.yml --become --become-user=janedoe --ask-become-pass # become sudo user

# Other option
--inventory=PATH (-i PATH):
--verbose (-vvvv):
--extra-vars=VARS (-e VARS):
--forks=NUM(-f NUM): Numberforforks(integer)
--connection=TYPE(-c TYPE):
--check (‘DryRun’)

