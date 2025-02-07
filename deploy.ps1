kubectl apply -f Infra\Namespace\namespace.yaml
kubectl apply -f Infra\Secrets\secrets.yaml
kubectl apply -f Infra\ConfigMaps\configmaps.yaml
kubectl apply -f Infra\PersistentVolumes\persistentvolumes.yaml

kubectl apply -f Infra\Deployments\infra.yaml
kubectl apply -f Infra\Services\infra.yaml

$namespace = "hackathon-28"
$postgresPodLabel = "app=postgres"
Write-Host "Waiting for PostgreSQL pod to be ready..."
while ($true) {
    $pods = kubectl get pods -n $namespace -l $postgresPodLabel --no-headers
    $readyPod = $pods | Select-String "Running" | Where-Object { $_ -match "1/1" }

    if ($readyPod) {
        Write-Host "PostgreSQL pod is ready!"
        break
    }

    Write-Host "PostgreSQL pod is not ready yet. Retrying in 5 seconds..."
    Start-Sleep -Seconds 5
}

kubectl apply -f Infra\Jobs\database.yaml
kubectl apply -f Infra\Jobs\migrations.yaml

kubectl apply -f Infra\Deployments\api.yaml
kubectl apply -f Infra\Services\api.yaml
kubectl apply -f Infra\HPA\hpa.yaml

