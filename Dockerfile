FROM 4oh4/jenkins-docker

USER root

RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y php7.0 php7.0-xdebug php7.0-xsl php7.0-dom hp7.0-zip php7.0-mbstring

USER jenkins
