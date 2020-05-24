from ansible.module_utils.basic import *

def main():

    import os
    import json
    import requests
    import subprocess


    fields = {
        "apidbtoken": {"default": True, "type": "str"},
    }

    module = AnsibleModule(argument_spec=fields)


    directory='/tmp/facts/'
    for filename in os.listdir(directory):
        API_KEY =  module.params["apidbtoken"]
        API_ENDPOINT = "http://api.apidb.io"
        headers = {
        'Authorization': "Token " + API_KEY,
        'Content-Type': 'text/json'
        }
        data = open(directory + filename, 'rb').read()
        r = requests.post(url = API_ENDPOINT, headers=headers, data=data)
        result = r.text
        module.params.update({filename: result})
        os.system("rm -rf /tmp/facts/" + filename) # Need some logic here to check if it was successful before deleting (we could also not do a for loop and pass the hostname and filename



    module.params.update({"Result": "OK"})
    module.params.update({"url": API_ENDPOINT})
    module.params.update({"token": API_KEY})

    module.exit_json(changed=True, meta=module.params) # Its this changed=True that we would alter if the r.text was a problem... i think!


if __name__ == '__main__':
    main()

