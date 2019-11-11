echo "startup script is running"
echo "Running as:"
whoami
cat /etc/nginx/sed.template | /usr/bin/envsubst > /tmp/sed.script
echo "sed script contents:"
cat /tmp/sed.script
echo ""
sed -f /tmp/sed.script /etc/nginx/nginx.template > /etc/nginx/nginx.conf
echo " "
echo "About to run proxy with the following nginx.conf:"
cat /etc/nginx/nginx.conf
echo "Starting NGINX"
nginx