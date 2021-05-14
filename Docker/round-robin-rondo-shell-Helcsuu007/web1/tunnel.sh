#!/bin/bash
# Write your SSH remote port forward tunnelling command here, e.g.
# ssh -TNi ../id_rsa -R <REMOTE_PORT>:localhost:<LOCAL_PORT> codecool@<REMOTE_IP>
ssh -TNi /home/ubuntu/id_rsa/id_rsa -R 16202:localhost:80 codecool@18.184.218.192