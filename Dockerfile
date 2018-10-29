FROM weblate/weblate

RUN pip3 install git+https://github.com/acsone/weblate-odoo-component-generator#egg=weblate-odoo-component-generator

# wocg-oca needs oca-maintainer-tools to enumerate addons repos and branches
RUN apt-get install -y virtualenv && \
  virtualenv /opt/oca-maintainer-tools && \
  /opt/oca-maintainer-tools/bin/pip install git+https://github.com/OCA/maintainer-tools#egg=oca-maintainer-tools

COPY wocg-oca /usr/local/bin/

# ssmtp to have sendmail, so cron can send notifications
RUN apt-get install -y ssmtp
COPY ssmtp.conf /etc/ssmtp/

RUN apt-get install cron
COPY supervisor-cron.conf /etc/supervisor/conf.d/
COPY crontab.txt /tmp/
RUN crontab -u weblate /tmp/crontab.txt ; rm /tmp/crontab.txt

COPY start /opt/oca/
ENTRYPOINT ["/opt/oca/start"]
CMD ["runserver"]
