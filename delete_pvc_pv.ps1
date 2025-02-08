kubectl delete pvc --force=true postgres-hackathon-28-pvc -n hackathon-28
Start-Sleep -Seconds 5
kubectl delete pv --force=true postgres-hackathon-28-pv -n hackathon-28