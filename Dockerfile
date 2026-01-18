FROM weblate/weblate:5.15.2.0

USER 0

RUN . /app/venv/bin/activate \
 && uv pip install \
      --no-cache-dir \
      --compile-bytecode \
      "weblate-odoo-component-generator @ git+https://github.com/acsone/weblate-odoo-component-generator@91137b52d3dfbd1ded4a1d4648433cd3b6f79dec"

# wocg-oca needs oca-maintainer-tools to enumerate addons repos and branches
RUN python3 -m venv /opt/oca-maintainer-tools && \
  /opt/oca-maintainer-tools/bin/pip install --no-cache-dir git+https://github.com/OCA/maintainer-tools@71aa4caec15e8c1456b4da19e9f39aa0aa7377a9

COPY wocg-oca /usr/local/bin/

USER 1000
