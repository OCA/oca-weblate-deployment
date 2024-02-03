FROM weblate/weblate:4.17-2

USER 0

RUN pip install --no-cache-dir "weblate-odoo-component-generator @ git+https://github.com/acsone/weblate-odoo-component-generator@bfe023bdb6b0fdb10b75a6b86adbe5fafd773197"

# wocg-oca needs oca-maintainer-tools to enumerate addons repos and branches
RUN python3 -m venv /opt/oca-maintainer-tools && \
  /opt/oca-maintainer-tools/bin/pip install --no-cache-dir -U pip wheel setuptools && \
  /opt/oca-maintainer-tools/bin/pip install --no-cache-dir git+https://github.com/OCA/maintainer-tools@76f737e7499538f4a133325811088c1347aa28fb

COPY wocg-oca /usr/local/bin/

USER 1000
