# Base image
FROM alpine:3.13

# Intalls the AWS CLI and other required dependencies
RUN apk add --no-cache \
    python3 \
    py3-pip \
 && pip3 install --upgrade pip \
 && pip3 install \
    awscli \
 && apk -v --purge del py-pip \
 && rm -rf /var/cache/apk/*

# Copies and set up the main command
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
