touch status.txt
echo ""> /root/status.txt
wall -n "Creating ecommerce deployment."

git clone https://github.com/arapulido/autoscaling-workshop-files.git k8s-manifests

NNODES=$(kubectl get nodes | grep Ready | wc -l)

while [ "$NNODES" != "2" ]; do
  sleep 0.3
  NNODES=$(kubectl get nodes | grep Ready | wc -l)
done

echo "Applying metrics server and commerce app"

kubectl apply -f k8s-manifests/metrics-server/
kubectl apply -f k8s-manifests/ecommerce-app/
kubectl apply -f datadog/serviceaccount.yaml
kubectl apply -f datadog/datadog-agent.yaml

NPODS=$(kubectl get pods --field-selector=status.phase=Running | grep -v NAME | wc -l)

while [ "$NPODS" != "6" ]; do
  sleep 0.3
  NPODS=$(kubectl get pods --field-selector=status.phase=Running | grep -v NAME | wc -l)
done

echo "complete">>/root/status.txt