import os
import subprocess
import pystache
import urllib2
from docker import Client
from string import Template

c = Client(base_url='unix://mount/run/docker.sock')
f = open('/config.tpl', 'r')

v = {'Memory': [], 'CarbonHost': os.environ['CARBON_PORT_2003_TCP_ADDR'], 'CarbonPort': os.environ['CARBON_PORT_2003_TCP_PORT']}
for val in c.containers():
  v['Memory'].append({'Id': val['Id'], 'Instance': val['Names'][0]})

config = pystache.render(f.read(), v)

output = open('/etc/collectd/collectd.conf', 'w')
output.write(config)
output.close()
subprocess.check_call(["/usr/sbin/collectd", "-f"]) 
