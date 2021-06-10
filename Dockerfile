FROM openjdk:7
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN apt-get update && \
	apt-get install -y maven && \
	cd gitManager/ && \
	mvn install && \
	cd ../refactor-analysis/ && \
	mvn install && \
	chmod +x srcML/src2srcml && \
	chmod +x srcML/srcml2src
WORKDIR /usr/src/myapp/refactor-analysis/
CMD	["java","-jar","target/refactor-analysis-0.0.1-SNAPSHOT-jar-with-dependencies.jar"]