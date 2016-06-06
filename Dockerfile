FROM zhiqzhao/ubuntu_btm_osb111170:latest

MAINTAINER Henry Zhao (https://www.linkedin.com/in/dreamerhenry)

USER root

ENV PATH $PATH:/root/Oracle/Middleware/user_projects/domains/osb_domain/bin

#Download create domain script
RUN wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=0B-NEimEr29WdS09qbHFYZFRub2M' -O create-osb-domain.py

RUN chmod -R a+x /create-osb-domain.py /root/Oracle/Middleware/Oracle_OSB1/common/bin

RUN /root/Oracle/Middleware/Oracle_OSB1/common/bin/wlst.sh -skipWLSModuleScanning /create-osb-domain.py

# Expose Node Manager default port, and also default http/https ports for admin console
EXPOSE 7001 8001 5556 8453 36963

CMD ["/root/Oracle/Middleware/user_projects/domains/osb_domain/bin/startWebLogic.sh"]