FROM alpine

# Update package repositories and install required tools
RUN apk update \
    && apk add --no-cache bash curl jq bind-tools gettext openssl openssh-client wget ca-certificates unzip git python

# Install gcloud SDK
RUN wget -O /tmp/google-cloud-sdk.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.tar.gz \
    && tar -xzf /tmp/google-cloud-sdk.tar.gz -C /usr/local \
    && /usr/local/google-cloud-sdk/install.sh \
    && rm /tmp/google-cloud-sdk.tar.gz

# Set up working directory and copy configuration files
WORKDIR /config
COPY base /config/base

# Set default command
CMD ["bash"]