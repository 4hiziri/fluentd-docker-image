FROM debian

ADD limits.conf /etc/security/limits.conf
ADD sysctl.conf /etc/sysctl.conf

# update system
RUN apt update
RUN apt upgrade -y

# install fluentd
RUN curl -L https://toolbelt.treasuredata.com/sh/install-ubuntu-xenial-td-agent3.sh | sh

RUN apt install -y libcurl4-openssl-dev gcc
# RUN /opt/td-agent/embedded/bin/fluent-gem install fluent-plugin-elasticsearch
# RUN /opt/td-agent/embedded/bin/fluent-gem install fluent-plugin-netflow


ENTRYPOINT service td-agent start && tail -f /dev/null
