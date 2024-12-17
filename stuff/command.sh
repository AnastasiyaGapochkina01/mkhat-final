vault auth enable approle

# add policy
path "mkhat/data/database*" {
  capabilities = [ "read", "list" ]
}

vault write auth/approle/role/ansible policies=ansible
vault read auth/approle/role/ansible/role-id
vault write -f auth/approle/role/ansible/secret-id

===> <===
chmod 777 render/
ansible-galaxy collection install community.docker


ansible-playbook -i inventory -e compose_network="audit-svc" -e secretid="2129adfb-0794-1d4b-71bd-159845d6610b" -e roleid="b7729af1-1da2-14f6-89f8-fd218106640c" runbook.yml