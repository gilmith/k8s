minikube start -p desarrollo
sleep 60
echo "start db"
ADYDDB=`kubectl --namespace adyd get pods | grep adyddb | cut -d' ' -f1`
nohup kubectl --namespace adyd port-forward --address 0.0.0.0 ${ADYDDB} 5432:5432 &
echo "start config"
CONFIG=`kubectl --namespace adyd get pods | grep configserver | cut -d' ' -f1`
nohup kubectl --namespace adyd port-forward --address 0.0.0.0 ${CONFIG} 10001:10001 &
echo "start login"
LOGIN=`kubectl --namespace adyd get pods | grep loginadyd | cut -d' ' -f1`
nohup kubectl --namespace adyd port-forward --address 0.0.0.0 ${LOGIN} 10002:10002 &
echo "pgadmin"
PGADMIN=`kubectl --namespace adyd get pods | grep pgadmin | cut -d' ' -f1`
nohup kubectl --namespace adyd port-forward --address 0.0.0.0 ${PGADMIN} 600:80 &
