FROM weblate/weblate:5.10

USER 0

RUN . /app/venv/bin/activate \
 && uv pip install \
      --no-cache-dir \
      --compile-bytecode \
      "weblate-odoo-component-generator @ git+https://github.com/acsone/weblate-odoo-component-generator@283f721bfb3d3184120ca94169a52ad4259f8ab7"

# wocg-oca needs oca-maintainer-tools to enumerate addons repos and branches
RUN python3 -m venv /opt/oca-maintainer-tools && \
  /opt/oca-maintainer-tools/bin/pip install --no-cache-dir git+https://github.com/OCA/maintainer-tools@b89f767503be6ab2b11e4f50a7557cb20066e667

COPY wocg-oca /usr/local/bin/

USER 1000
