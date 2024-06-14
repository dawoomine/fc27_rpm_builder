FROM --platform=x86_64 fedora:27
WORKDIR /opt/fedora

RUN dnf group install "C Development Tools and Libraries" \
                      "Development Tools" \
                      "RPM Development Tools" \
                       -y
RUN dnf install openssh-server -y
RUN /usr/bin/ssh-keygen -A

EXPOSE 22
ENTRYPOINT /usr/sbin/sshd
CMD ["-D"]
