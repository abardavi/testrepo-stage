FROM registry.access.redhat.com/ubi8/ubi-minimal:8.10-1785302592

COPY --chmod=755 entrypoint.sh /entrypoint.sh

RUN microdnf install tar gzip

RUN mkdir /releases && \
    echo "test tar file creation" > /tmp/mytext.txt && \
    tar -czf /releases/test-file-1.tar.gz /tmp/mytext.txt

ENTRYPOINT ["/entrypoint.sh"]
