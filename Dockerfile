FROM weblate/weblate:4.3.2-1

USER 0

RUN pip3 install git+https://github.com/acsone/weblate-odoo-component-generator@988a69bc95c9a303a5e400c88acafba4d6a4e2fb#egg=weblate-odoo-component-generator

# wocg-oca needs oca-maintainer-tools to enumerate addons repos and branches
RUN apt-get update && \
  apt-get install -y python3-venv && \
  python3 -m venv /opt/oca-maintainer-tools && \
  /opt/oca-maintainer-tools/bin/pip install wheel && \
  /opt/oca-maintainer-tools/bin/pip install git+https://github.com/OCA/maintainer-tools@2c66e72d2fc12e919b85b75088215ed35c579c3b#egg=oca-maintainer-tools

COPY wocg-oca /usr/local/bin/

USER 1000

CMD ["runserver"]
