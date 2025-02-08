docker build -t cdoiche/hackathon-28-api-paciente:v1 hackathon-28-pacientes\
docker push cdoiche/hackathon-28-api-paciente:v1

docker build -t cdoiche/hackathon-28-api-agendamento:v1 Fiap.Api\
docker push cdoiche/hackathon-28-api-agendamento:v1

docker build -t cdoiche/hackathon-28-api-medico:v1 hackathon-fiap\HackathonFiap\
docker push cdoiche/hackathon-28-api-medico:v1