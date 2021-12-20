FROM summerwind/actions-runner:v2.285.1-ubuntu-20.04

USER root

ENV DEBIAN_FRONTEND=noninteractive
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" \
    && cd /tmp/ \
    && unzip awscliv2.zip \
    && ./aws/install \
    && /usr/local/bin/aws --version \
    && rm /tmp/awscliv2.zip \
    && rm -rf /tmp/aws/

USER runner

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
CMD ["/entrypoint.sh"]