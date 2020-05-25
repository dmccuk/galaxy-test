Role Name
=========

This role gives you a framework to implement local facts (some people call them custome facts) within your server environment.

Installation
===========

Using ansible-galaxy:
````
$ ansible-galaxy install weareinteractive.nginx
````

Using requirements.yml:
```
- src: weareinteractive.nginx
````

Using git:
````
$ git clone https://github.com/dmccuk/local-facts.git
````

Requirements
------------

There are no specific requirements to use this role. Just an ansible version of 2.5 or above.

In the code I give examples of creating local facts from AWS meta-data. You can use this or remove it and add your own.

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

Ansible >= 2.5

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

- hosts: servers
  gather_facts: True
      roles:
         - local_facts

License
-------

BSD

Author Information
------------------

Dennis McCarthy
