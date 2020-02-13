source /opt/stackstorm/st2/bin/activate

./autoresponder.py
python -c '
import json

from st2client.client import Client

token = json.load(open("/root/.st2/token-st2admin"))["token"]
c = Client(token=token)

while True:
    for inquiry in c.inquiries.get_all():
        iid = inquiry.id

        print "responding to id: {}".format(iid)
        c.inquiries.respond(iid, {"custom_inner_pause": False})  
'
