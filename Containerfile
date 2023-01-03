FROM fedora:37

RUN dnf -y install 'dnf-command(copr)' && \
    dnf -y copr enable grillo-delmal/dub-hack && \
    dnf -y install \
        dub \
        rsync \
        ldc

ADD data/settings.json /var/lib/dub/settings.json