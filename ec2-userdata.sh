#!/bin/bash
set -eux

# Update system and install nginx
apt-get update -y
apt-get install -y nginx

# Enable & start nginx
systemctl enable nginx
systemctl start nginx

# Create custom HTML in /var/www/html/index.html
cat > /var/www/html/index.html <<'EOF'
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>EC2 Launched 🎉</title>
  <style>
    body {
      margin:0;
      height:100vh;
      display:flex;
      align-items:center;
      justify-content:center;
      background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
      font-family: Arial, Helvetica, sans-serif;
      color:#fff;
      text-align:center;
    }
    .card {
      background: rgba(255,255,255,0.1);
      padding: 40px;
      border-radius: 16px;
      box-shadow: 0 8px 24px rgba(0,0,0,0.4);
      backdrop-filter: blur(6px);
    }
    h1 {
      font-size: 2.5em;
      margin: 0 0 20px;
      text-shadow: 0 0 8px rgba(255,255,255,0.6);
    }
    p {
      font-size: 1.1em;
      opacity:0.9;
    }
  </style>
</head>
<body>
  <div class="card">
    <h1>Hey man 🚀</h1>
    <p>You launched your <b>1st EC2</b> instance!</p>
  </div>
</body>
</html>
EOF