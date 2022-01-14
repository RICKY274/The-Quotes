all:
	mvn clean
	mvn validate
	mvn compile
	mvn test
	mvn package
	mvn verify

#Docker commands
#docker_all:
#	make build_image
#	make run_docker_container
#
#build_image:
#	docker build -t server .
#
#run_docker_container:
#	docker run -dp 5000:5000 server