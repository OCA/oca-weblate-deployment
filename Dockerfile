FROM weblate/weblate:3.8-2

USER 0

RUN pip3 install git+https://github.com/acsone/weblate-odoo-component-generator@a612a2ab861a91f6b30a2ac56bdf52b42c84cfd2#egg=weblate-odoo-component-generator

# wocg-oca needs oca-maintainer-tools to enumerate addons repos and branches
RUN apt-get install -y python3-venv && \
  python3 -m venv /opt/oca-maintainer-tools && \
  /opt/oca-maintainer-tools/bin/pip install git+https://github.com/OCA/maintainer-tools@cc8903edd370bcd19c2e04bb9b928ef11862ad8b#egg=oca-maintainer-tools

COPY wocg-oca /usr/local/bin/

USER 1000

CMD ["runserver"]
