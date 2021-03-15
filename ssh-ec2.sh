#!/bin/bash
scp -i ~/Documents/fuse/big-blue.pem ~/Documents/fuse/bigbluebot/docker-compose.yml ec2-user@$1:~
scp -i ~/Documents/fuse/big-blue.pem ~/Documents/fuse/bigbluebot/ec2-script.sh ec2-user@$1:~
ssh -i ~/Documents/fuse/big-blue.pem ec2-user@18.236.247.234 << EOF
    chmod +x ./ec2-script.sh
    ./ec2-script.sh
    EOF

