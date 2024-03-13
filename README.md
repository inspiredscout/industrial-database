# industrial-database
for RTU MIREA
docker build -t my-pgadmin .
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' f30ad9403429