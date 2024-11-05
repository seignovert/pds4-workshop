# OpenJDK Docker images are depreciated, use AWS Corretto instead.
FROM amazoncorretto:23-alpine

# PDS Validate Tool (https://nasa-pds.github.io/validate/)
ENV PDS4_VALIDATE_VERSION "3.6.0"

# PDS4 Local Data Dictionary Tool (https://nasa-pds.github.io/pds4-information-model/model-lddtool/)
ENV PDS4_LDDTOOL_VERSION "15.1.0"

# Download libraries from Github
ADD https://github.com/NASA-PDS/validate/releases/download/v${PDS4_VALIDATE_VERSION}/validate-${PDS4_VALIDATE_VERSION}-bin.tar.gz /tmp/
ADD https://github.com/NASA-PDS/pds4-information-model/releases/download/v${PDS4_LDDTOOL_VERSION}/lddtool-${PDS4_LDDTOOL_VERSION}-bin.tar.gz /tmp/

# Install the libraries
RUN tar -zxvf /tmp/validate-${PDS4_VALIDATE_VERSION}-bin.tar.gz && \
    mv validate-${PDS4_VALIDATE_VERSION} /usr/local/pds4-validate && \
    rm /tmp/validate-${PDS4_VALIDATE_VERSION}-bin.tar.gz

RUN tar -zxvf /tmp/lddtool-${PDS4_LDDTOOL_VERSION}-bin.tar.gz && \
    mv lddtool-${PDS4_LDDTOOL_VERSION} /usr/local/pds4-lddtool && \
    rm /tmp/lddtool-${PDS4_LDDTOOL_VERSION}-bin.tar.gz

# Add the libraries to the path
ENV PATH "${PATH}:/usr/local/pds4-validate/bin:/usr/local/pds4-lddtool/bin"

# Set working directy (usually you need to add a volume to this endpoint)
WORKDIR /data
