Docker composition for the OCA weblate deployment
=================================================

* copy ``environment.sample`` to ``environment`` and adapt it
* docker-compose build
* docker-compose up
* setup a cron that ``docker exec wocg-oca`` periodically
