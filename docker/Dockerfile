FROM artifactory.riftio.com/docker/rw.base:ub18

RUN apt update -y && \
    apt install -y \
    libssl-dev python3-dev sshpass apt-transport-https jq moreutils \
    ca-certificates curl gnupg2 software-properties-common python3-pip rsync
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable" \
    && apt update -y && apt-get install docker-ce -y
ADD test_requirements.txt test_requirements.txt
ADD requirements.txt requirements.txt
RUN /usr/bin/python3 -m pip install pip -U && /usr/bin/python3 -m pip install -r test_requirements.txt && python3 -m pip install -r requirements.txt && update-alternatives --install /usr/bin/python python /usr/bin/python3 1
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.17.5/bin/linux/amd64/kubectl \
    && chmod a+x kubectl && cp kubectl /usr/local/bin/kubectl

# Some tools like yamllint need this
ENV LANG=C.UTF-8
ADD id_grunt /root/.ssh/id_grunt
RUN chmod 700 /root/.ssh && chmod 600 /root/.ssh/id_grunt
