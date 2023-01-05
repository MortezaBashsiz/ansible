#!/bin/bash  -
#===============================================================================
#
#          FILE: v2ray.sh
#
#         USAGE: ./v2ray.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Morteza Bashsiz (mb), morteza.bashsiz@gmail.com
#  ORGANIZATION: Linux
#       CREATED: 01/01/2023 10:14:30 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

domain="$1"
preDomain="$2"
mainDomain="$3"
mkdir -p /opt/v2ray_urls

# shellcheck disable=SC2044
for file in $(find /etc/v2ray/ -type f -iname "v2ray[0-9][0-9].json");
do
	date=$(date '+%Y%m%d')
	endPoint=$(jq .inbounds < "$file" | jq .[].streamSettings.wsSettings.path)
	uuidList=$(jq .inbounds < "$file" | jq .[].settings.clients | jq .[].id)
	hostName=$(hostname)
  # shellcheck disable=SC2001
	apiName=$(echo "$endPoint" | sed 's/\"//g')
	rm -fr /opt/v2ray_urls/"$apiName"
	mkdir -p /opt/v2ray_urls/"$apiName"
	for uuId in $uuidList;
	do	
		# shellcheck disable=SC2001
		name=$(echo "$uuId" | sed 's/\"//g')
		jsonClient_1=$(cat << EOF
{
"add":"$domain", 
"aid":"64", 
"alpn":"", 
"host":"$preDomain$hostName.$mainDomain", 
"id":$uuId, 
"net":"ws", 
"path":$endPoint, 
"port":"443", 
"ps":"Sudoer_VPN_bot", 
"scy":"auto", 
"sni":"$preDomain$hostName.$mainDomain", 
"tls":"tls", 
"type":"", 
"v":"2" 
}
EOF
)
		encoded=$(echo "$jsonClient_1" | base64 -w 0)
		echo "vmess://$encoded" > /opt/v2ray_urls/"$apiName"/"$date"_"$name"".url"
	done
done

