#!/bin/sh
wget -O xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip
unzip xray.zip
cat << EOF > config.json
{
  "log": {
    "loglevel": "warning"
  },
  "inbounds": [
    {
      "port": ${PORT:-8080},
      "protocol": "vless",
      "settings": {
        "clients": [
          {
            "id": "${UUID:-b831381d-6324-4d53-ad4f-8cda98b3f811}"
          }
        ],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "ws"
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}
EOF
./xray run -config config.json
