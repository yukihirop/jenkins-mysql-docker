FROM jenkins

USER root

# in order to create the jenkins db
RUN apt-get update && apt-get -y install mysql-client && apt-get clean

# install mysql plugin and repackage war
RUN curl -Ls --create-dirs -o /tmp/WEB-INF/plugins/database.hpi https://updates.jenkins-ci.org/latest/database.hpi \
  && curl -Ls --create-dirs -o /tmp/WEB-INF/plugins/database-mysql.hpi https://updates.jenkins-ci.org/latest/database-mysql.hpi \
  && cd /tmp && zip -g /usr/share/jenkins/jenkins.war WEB-INF/*/* && rm -rf /tmp/WEB-INF

ADD ./jenkins-mysql.sh /usr/local/bin/jenkins-mysql.sh
RUN chmod +x /usr/local/bin/jenkins-mysql.sh

USER jenkins

CMD ["/usr/local/bin/jenkins-mysql.sh"]
