FROM sonarqube:5.6
MAINTAINER Marco Pas "marco.pas@gmx.net"

# install plugins taken from:
# - http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/
# - https://sonarsource.bintray.com/Distribution/
# - https://github.com/SonarQubeCommunity/

# create plugin download location; so we can copy them later when SonarQube is started
ENV PLUGIN_DOWNLOAD_LOCATION /opt/plugins-download
RUN mkdir -p $PLUGIN_DOWNLOAD_LOCATION
WORKDIR ${PLUGIN_DOWNLOAD_LOCATION}

# download the actual plugins
RUN wget https://sonarsource.bintray.com/Distribution/sonar-java-plugin/sonar-java-plugin-4.0.jar
RUN wget https://sonarsource.bintray.com/Distribution/sonar-javascript-plugin/sonar-javascript-plugin-2.8.jar
RUN wget https://github.com/SonarQubeCommunity/sonar-findbugs/releases/download/3.4/sonar-findbugs-plugin-3.4.3.jar
RUN wget https://sonarsource.bintray.com/Distribution/sonar-scm-git-plugin/sonar-scm-git-plugin-1.2.jar
RUN wget https://sonarsource.bintray.com/Distribution/sonar-widget-lab-plugin/sonar-widget-lab-plugin-1.8.1.jar
RUN wget https://github.com/SonarQubeCommunity/sonar-pmd/releases/download/2.6/sonar-pmd-plugin-2.6.jar
RUN wget https://sonarsource.bintray.com/Distribution/sonar-generic-coverage/sonar-generic-coverage-plugin-1.2.jar
RUN wget https://sonarsource.bintray.com/Distribution/sonar-groovy-plugin/sonar-groovy-plugin-1.3.1.jar
RUN wget https://sonarsource.bintray.com/Distribution/sonar-web-plugin/sonar-web-plugin-2.4.jar
RUN wget https://sonarsource.bintray.com/Distribution/sonar-xml-plugin/sonar-xml-plugin-1.4.1.jar

RUN wget http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-timeline-plugin/1.5/sonar-timeline-plugin-1.5.jar
RUN wget https://github.com/SonarQubeCommunity/sonar-sonargraph/releases/download/sonar-sonargraph-plugin-3.5/sonar-sonargraph-plugin-3.5.jar


COPY docker-entrypoint.sh /opt/docker-entrypoint.sh
RUN chmod +x /opt/docker-entrypoint.sh

WORKDIR ${SONARQUBE_HOME}
ENTRYPOINT ["/opt/docker-entrypoint.sh"]