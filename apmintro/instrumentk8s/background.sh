touch status.txt
echo ""> /root/status.txt
wall -n "Creating ecommerce deployment."

git clone https://github.com/arapulido/autoscaling-workshop-files.git /root/datadog/k8s-manifests
git clone https://github.com/shehreendheda/ecommerce-observability /root/app-files
git checkout no-apm-instrumentation
mkdir /root/datadog/app-files
cp /root/app-files/store-frontend /root/datadog/app-files/store-frontend -r
cp /root/app-files/ads-service /root/datadog/app-files/ads-service -r
cp /root/app-files/discounts-service /root/datadog/app-files/discounts-service -r
cd /root

NNODES=$(kubectl get nodes | grep Ready | wc -l)

while [ "$NNODES" != "2" ]; do
  sleep 0.3
  NNODES=$(kubectl get nodes | grep Ready | wc -l)
done

echo "Applying metrics server and commerce app"

kubectl apply -f datadog/k8s-manifests/metrics-server/
kubectl apply -f datadog/k8s-manifests/ecommerce-app/
kubectl apply -f datadog/serviceaccount.yaml
kubectl apply -f datadog/datadog-agent.yaml

NPODS=$(kubectl get pods --field-selector=status.phase=Running | grep -v NAME | wc -l)

while [ "$NPODS" != "5" ]; do
  sleep 0.3
  NPODS=$(kubectl get pods --field-selector=status.phase=Running | grep -v NAME | wc -l)
done

echo "complete">>/root/status.txt