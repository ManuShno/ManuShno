Change ownership of database mount to 999:999 on nfs server.

Command for using hosted shell scripts
curl -s &lt;https location&gt; | bash -s &lt;cli agruments&gt;

Init command
APPLICATION=&lt;application name&gt; &&
DOMAIN=&lt;https location&gt; &&
curl -s $DOMAIN/$APPLICATION/.init.sh | bash -s $DOMAIN $APPLICATION

Ingress Nginx command
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.0.4/deploy/static/provider/baremetal/deploy.yaml

Issues with multipass run the kill and start each vm in turn
sudo killall -9 qemu-system-x86_64