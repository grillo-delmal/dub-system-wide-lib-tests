FROM fedora:40

RUN dnf -y install \
        rsync \
        ldc \
        curl-devel \
        git

ARG DUB_COMMIT

# Download dub and checkout current commit
WORKDIR /opt
RUN git clone https://github.com/dlang/dub.git && \
    [[ ! -z "$DUB_COMMIT" ]] && \
        git -C /opt/dub checkout $DUB_COMMIT || \
    true

# Build dub
RUN cd /opt/dub && \
    ldc2 -run ./build.d

# Install dub
RUN ln -s /opt/dub/bin/dub /usr/local/bin/dub

ADD data/settings.json /var/lib/dub/settings.json