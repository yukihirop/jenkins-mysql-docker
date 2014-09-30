docker-jenkins-mysql
==========================

Docker image for Jenkins, with mysql plugin installed.
Based on the [official image](https://registry.hub.docker.com/_/jenkins/).

# Running

Run [mysql](https://registry.hub.docker.com/_/mysql/) in a separate container, then run Jenkins linked to it.

    # Run mysql
    docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=mysecretpassword -d mysql
    # Run jenkins
    docker run --name jenkins -e JENKINS_DB_PASSWORD=jenkins --link some-mysql:mysql -p 8080:8080 -p 37727:37727 csanchez/jenkins-swarm-mysql

# Building

    docker build -t csanchez/jenkins-mysql .
