# Server side
[REMOTE]
  git remote add staging dokku@sso-poc.anahoret.com:app
## Initial setup
Use Ansible with git@gitlab.anahoret.com:ansible/ansible-playbook-sso-poc.git (inventory group **apps**).

## Add developer keys
``echo <developer_public_key> | [sudo] sshcommand acl-add dokku <developer_name>``
