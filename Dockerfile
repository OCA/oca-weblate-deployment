FROM weblate/weblate:5.6

USER 0

RUN . /app/venv/bin/activate \
 && uv pip install \
      --no-cache-dir \
      --compile-bytecode \
      "weblate-odoo-component-generator @ git+https://github.com/acsone/weblate-odoo-component-generator@6509159413f64a0c3f7f98a27e543e06a834e897"

# wocg-oca needs oca-maintainer-tools to enumerate addons repos and branches
RUN python3 -m venv /opt/oca-maintainer-tools && \
  /opt/oca-maintainer-tools/bin/pip install --no-cache-dir -U pip wheel setuptools && \
  /opt/oca-maintainer-tools/bin/pip install --no-cache-dir git+https://github.com/OCA/maintainer-tools@63ba9627deddcdea37a4a43a532b586e2d4e7114

COPY wocg-oca /usr/local/bin/

USER 1000
