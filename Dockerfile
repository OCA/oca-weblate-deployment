FROM weblate/weblate:3.7.1-1

RUN pip3 install git+https://github.com/acsone/weblate-odoo-component-generator@85977668c26309b657160f4969a54914f995760c#egg=weblate-odoo-component-generator

# wocg-oca needs oca-maintainer-tools to enumerate addons repos and branches
RUN apt-get install -y virtualenv && \
  virtualenv /opt/oca-maintainer-tools && \
  /opt/oca-maintainer-tools/bin/pip install git+https://github.com/OCA/maintainer-tools#egg=oca-maintainer-tools

COPY wocg-oca /usr/local/bin/

CMD ["runserver"]
