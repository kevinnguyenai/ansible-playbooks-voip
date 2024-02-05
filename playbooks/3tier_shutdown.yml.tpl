---
- name: Shutdown web layer
  hosts: localhost
  gather_facts: true

  tasks:
    - name: Perform shutdown for apache servers
      ansible.builtin.include_role:
        name: apache
        tasks_from: shutdown.yml

- name: Shutdown app layer
  hosts: app
  gather_facts: true

  tasks:
    - name: Perform shutdown for tomcat servers
      ansible.builtin.include_role:
        name: tomcat
        tasks_from: shutdown.yml

- name: Shutdown database layer
  hosts: db
  gather_facts: true

  tasks:
    - name: Perform shutdown for postgres database
      ansible.builtin.include_role:
        name: postgres
        tasks_from: shutdown.yml
