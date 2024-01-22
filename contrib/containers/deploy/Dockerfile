FROM phusion/baseimage:focal-1.0.0
LABEL maintainer="BlueMobius Developers <dev@bluemobius.org>"
LABEL description="Dockerised BlueMobius, built from Travis"

ARG USER_ID
ARG GROUP_ID

ENV HOME /home/bluemobius

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}
RUN groupadd -g ${GROUP_ID} bluemobius && \
    useradd -u ${USER_ID} -g bluemobius -s /bin/bash -m -d /home/bluemobius bluemobius && \
    mkdir /home/bluemobius/.bluemobius && \
    chown ${USER_ID}:${GROUP_ID} -R /home/bluemobius

COPY bin/* /usr/local/bin/

RUN chmod a+x /usr/local/bin/*

USER bluemobius

VOLUME ["/home/bluemobius"]

EXPOSE 15657 9999 25657 25658

WORKDIR /home/bluemobius
