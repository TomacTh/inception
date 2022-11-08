FROM debian:buster

ARG SSH_USER

ARG SSH_USER_PASSWORD

RUN apt-get -y update && apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    gpg \
    ssh \
    &&  curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get -y update && apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin

RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && echo "${SSH_USER}:${SSH_USER_PASSWORD}" | chpasswd 

RUN service ssh start

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
