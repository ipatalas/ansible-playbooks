# ansible-playbooks
Few playbooks I'm using to provision my Raspberry Pi. It happened to me few times that I had to make a reinstallation because my SD card got broken. Didn't want to face it again so I wrote this.

I do use my Pi as a media center (http://osmc.tv) and an IoT playground as well. Gotta separate it in future but can't decide which SBC to buy next so sticking to one for now. This playbook should be very easy to separate when the time comes.

Installed software and actions:
- some common Linux utils like mc, htop and stuff
- setting proper locale on OSMC
- node.js v8.x
- Samba server along with basic configuration I use
- InfluxDB to store my data
- Telegraf to pump the data from various sources (using Tp-Link HS110 to measure energy consumption)
- Grafana to display dashboards (I like the way it looks out of the box)
- scripts to backup/restore InfluxDB and Grafana settings (don't want to lose it again)

# Notes to myself if I forget

Command line to install everything (databases are not restored by default - not an idempotent operation):   
```bash
ansible-playbook osmc.yml -u osmc -v
```

Command line to install only a part using tags:   
```bash
ansible-playbook osmc.yml -u osmc -v --tags "influx,grafana"
```

Command line to restore Influx (and Grafana accordingly) database:   
```bash
ansible-playbook osmc.yml -u osmc -v --tags "influx" --extra-vars "restore=true"
```
