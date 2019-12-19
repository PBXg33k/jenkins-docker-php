FROM 4oh4/jenkins-docker

USER root

RUN apt-get install -y curl wget gnupg2 ca-certificates lsb-release apt-transport-https \
    && wget https://packages.sury.org/php/apt.gpg \
    && apt-key add apt.gpg \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php7.list \
    && apt-get update \
    && apt-get install -y php7.2 php7.2-cli php7.2-common php7.2-xml

USER jenkins
