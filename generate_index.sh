#!/bin/bash

# Gather system info
HOSTNAME=$(hostname)
UPTIME=$(uptime -p)
OS=$(uname -o)
KERNEL=$(uname -r)
MEMORY=$(free -h | grep Mem | awk '{print $2}')
CPU=$(lscpu | grep "Model name:" | awk -F: '{print $2}')

# Create an index.html file
cat <<EOF > index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>System Information</title>
</head>
<body>
    <h1>System Information</h1>
    <ul>
        <li><strong>Hostname:</strong> $HOSTNAME</li>
        <li><strong>Uptime:</strong> $UPTIME</li>
        <li><strong>Operating System:</strong> $OS</li>
        <li><strong>Kernel Version:</strong> $KERNEL</li>
        <li><strong>Total Memory:</strong> $MEMORY</li>
        <li><strong>CPU Model:</strong> $CPU</li>
    </ul>
</body>
</html>
EOF
