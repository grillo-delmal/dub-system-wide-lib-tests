FROM fedora:37

RUN dnf -y install \
        rsync \
        ldc \
        curl-devel \
        git

# Download dub
RUN cd /opt && \
    git clone https://github.com/dlang/dub.git

# Checkout a specific version here if needed :)
RUN git -C /opt/dub describe

# Build dub
RUN cd /opt/dub && \
    ldc2 -run ./build.d

# Install dub
RUN cp /opt/dub/bin/dub /usr/bin

ADD data/settings.json /var/lib/dub/settings.json