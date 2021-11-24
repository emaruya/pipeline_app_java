#!/bin/bash
- name: "clone projeto"
      ansible.builtin.git:
        repo: 'https://github.com/Didox/spring-web-youtube'
        dest: /home/ubuntu/spring-web-youtube
        clone: yes
        update: yes

    - name: "fazendo build do projeto"
      shell: "cd spring-web-youtube && mvn package"


ANSIBLE_OUT=$(ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key "/var/lib/jenkins/.ssh/id_rsa")
echo $ANSIBLE_OUT

## Mac ##
# MYSQL_POD_NAME=$(echo $ANSIBLE_OUT | grep -oE "(mysql-.*? )" )
## Linux ##
MYSQL_POD_NAME=$(echo $ANSIBLE_OUT | grep -oP "(mysql-.*? )" )

echo "Esperando subir os pods"
sleep 30

