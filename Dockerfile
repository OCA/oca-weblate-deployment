FROM weblate/weblate:3.6.1-1

RUN pip3 install git+https://github.com/acsone/weblate-odoo-component-generator@f7e7ac5dd0ca3c976db1a9176fa338dc3c94f555#egg=weblate-odoo-component-generator

# wocg-oca needs oca-maintainer-tools to enumerate addons repos and branches
RUN apt-get install -y virtualenv && \
  virtualenv /opt/oca-maintainer-tools && \
  /opt/oca-maintainer-tools/bin/pip install git+https://github.com/OCA/maintainer-tools#egg=oca-maintainer-tools

COPY wocg-oca /usr/local/bin/

CMD ["runserver"]
