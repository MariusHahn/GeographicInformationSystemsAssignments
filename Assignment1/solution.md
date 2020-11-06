# Assignment One

### Task 3 Loading a dataset

Voraussetzung: `wget https://download.geofabrik.de/europe/germany/baden-wuerttemberg/freiburg-regbez-latest.osm.pbf`

1. `sudo apt install osm2pgsql`
2. `osm2pgsql --database marius-postgis --host localhost --port 25432 --username marius --password --create --slim --drop --latlong --hstore-all freiburg-regbez-latest.osm.pbf` then type your password and go.