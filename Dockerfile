FROM 4oh4/jenkins-docker

USER root

COPY ./install-composer.sh install-composer.sh

RUN apt-get install -y --no-install-recommends curl wget gnupg2 ca-certificates lsb-release apt-transport-https \
    && wget https://packages.sury.org/php/apt.gpg \
    && apt-key add apt.gpg \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php7.list \
    && apt-get update \
    && apt-get install -y php7.2 php7.2-cli php7.2-common php7.2-xml php7.2-curl \
    && curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl \
    && chmod +x kubectl \
    && mv kubectl /usr/bin/kubectl \
    && curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
    && chmod 700 get_helm.sh \
    && ./get_helm.sh

RUN sh install-composer.sh \
    && composer global require hirak/prestissimo

USER jenkins
