# Subindo o ambiente
Siga os passos:
1. Clone os 4 repositórios dentro de uma pasta raiz. A estrutura de pastas deve ser:
    ```md
        Raiz
        ├── Fiap.Api (https://github.com/Nbgarcia/Fiap.Api.git)
        ├── hackathon-28-pacientes (https://github.com/cdoiche/hackathon28-pacientes.git)
        ├── hackathon-fiap (https://github.com/cleitonzummach/hackathon-fiap.git)
        │   └── HackathonFiap
        └── Infra (este repositório)
    ```
2. Rodar o script ```.\Infra\build-images.ps1```. Com ele, as imagens da api serão montadas e enviadas para o docker hub.
3. Rodar o script ```.\Infra\deploy.ps1```. O Docker Desktop deve estar funcionando, assim como o Kubernetes.
4. Para inspecionar o banco de dados, é necessário expor a porta do pod do banco. Para isso, primeiro execute o comando kubectl get pods, pegue o nome do pod da instância postgres, e use esse nome no seguinte comando ```kubectl port-forward --namespace hackathon-28 <nome do pod> 5432:5432``` (ex: postgres-deployment-74b5cb757f-8f58j). Assim, o banco estará exposto para fora do nó e será possível acessá-lo via Dbeaver (ou outro gerenciador)