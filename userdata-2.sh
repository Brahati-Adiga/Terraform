#!/bin/bash

apt update
apt install -y apache2

TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
    -H "X-aws-ec2-metadata-token-ttl-seconds: 21600" -s)
    
INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
    http://169.254.169.254/latest/meta-data/instance-id)
    
apt install -y awscli

cat <<EOF > /var/www/html/index.html
<html>
<head>
<title>Terraform Web Server</title>
</head>
<body>
<h1>Welcome to Terraform Web Server 2</h1>
<h1>Deployed via Terraform and User Data Script 2</h1>
<p>Instance ID: $INSTANCE_ID</p>
</body>
</html>
EOF

systemctl start apache2
systemctl enable apache2