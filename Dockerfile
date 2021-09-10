FROM bitnami/kubectl:1.20.10

USER root
ADD cleanup.sh /root/cleanup.sh
RUN chmod +x /root/cleanup.sh

ENTRYPOINT ["/root/cleanup.sh"]