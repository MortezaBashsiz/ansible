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

mkdir -p /opt/v2ray_urls

# shellcheck disable=SC2044
for file in $(find /etc/v2ray/ -type f -iname "v2ray[0-9][0-9].json");
do
	date=$(date '+%Y%m%d')
	endPoint=$(jq .inbounds < "$file" | jq .[].streamSettings.wsSettings.path)
	uuidList=$(jq .inbounds < "$file" | jq .[].settings.clients | jq .[].id)
	hostName=$(hostname -f)
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
"add":"66.235.200.136", 
"aid":"64", 
"alpn":"", 
"host":"schere$hostName", 
"id":$uuId, 
"net":"ws", 
"path":$endPoint, 
"port":"443", 
"ps":"sudoer", 
"scy":"auto", 
"sni":"schere$hostName", 
"tls":"tls", 
"type":"", 
"v":"2" 
}
EOF
)
		encoded=$(echo "$jsonClient_1" | base64 -w 0)
		echo "vmess://$encoded" > /opt/v2ray_urls/"$apiName"/"1_""$date"_"$name"".url"

		jsonClient_2=$(cat << EOF
{
"add":"23.227.38.97", 
"aid":"64", 
"alpn":"", 
"host":"schere$hostName", 
"id":$uuId, 
"net":"ws", 
"path":$endPoint, 
"port":"443", 
"ps":"sudoer", 
"scy":"auto", 
"sni":"schere$hostName", 
"tls":"tls", 
"type":"", 
"v":"2" 
}
EOF
)

		encoded=$(echo "$jsonClient_2" | base64 -w 0)
		echo "vmess://$encoded" > /opt/v2ray_urls/"$apiName"/"2_""$date"_"$name"".url"

	done
done

