FROM jenkins/jenkins:latest-jdk17

# evitar que el Wizard para la instalación asistida de Jenkins se lance al iniciar el
# contenedor, porque la configuración la aplicamos con JCasC
ENV JAVA_OPTS='-Djenkins.install.runSetupWizard=false'

# indicar la ubicacion del archivo de configuracion para Jenkins
ENV CASC_JENKINS_CONFIG=/var/jenkins_home/jenkins-casc.yaml

RUN jenkins-plugin-cli --plugins configuration-as-code

# el fichero de configuración para Jenkins
COPY jenkins-casc.yaml /var/jenkins_home/jenkins-casc.yaml

