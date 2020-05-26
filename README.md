Local Facts role
=========

````dmccuk.local_facts```` is an [Ansible](https://www.ansible.com) role that gives you a framework to implement local facts within your server environment.
 * This role installs NO packages.
 * Creates a local ````/etc/ansible/facts.d/local.fact```` file in the default ansible location.
 * Runs a script to collect facts and add them to the ````local.fact```` file.
 * Example: Creates a local ````/tmp/local_facts```` file containg some of the custom facts.
 * Example AWS fact creation can be found in ````files/customFactSetup.sh````

Edit as required.

Installation
===========

Using ansible-galaxy:
````
$ ansible-galaxy install dmccuk.local_facts
````

Using ansible-galaxy to install to the current directory:
````
$ ansible-galaxy install --roles-path . dmccuk.local_facts
````

Using requirements.yml:
```
- src: dmccuk.local_facts
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

There are no specific role variables. Instead you can configure you're own variables to pull out custom facts and use them in your playbooks.

Dependencies
------------

Ansible >= 2.5

Example Playbook
----------------

An example of how to use the role:

````
- hosts: all
  gather_facts: True
  roles:
    - local_facts
````

License
-------

BSD

Author Information
------------------

Dennis McCarthy
