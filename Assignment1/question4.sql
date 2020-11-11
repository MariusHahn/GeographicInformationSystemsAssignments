SELECT name, ST_Area(way :: geography) / (1000 * 1000) as area_sqkm
FROM planet_osm_polygon
WHERE name = 'Landkreis Konstanz'
  AND admin_level = '6';


-- Q4.2
with konstanz as (
    SELECT *
    FROM planet_osm_polygon
    WHERE admin_level = '6' AND name like '%Konstanz%'
    )
SELECT p.way
FROM planet_osm_polygon p
         join konstanz on st_contains(konstanz.way, p.way)
WHERE p.building like 'cathedral';

-- Q4.3

with distance_uni_cathedral as (
    with konstanz as (
        SELECT *
        FROM planet_osm_polygon
        WHERE admin_level = '6'
          AND name like '%Konstanz%'
    )
    SELECT ST_DISTANCE(p.way::geography, (SELECT way from planet_osm_polygon WHERE planet_osm_polygon.name like 'Uni-Konstanz')::geography) as distance_in_meter
    FROM planet_osm_polygon p
             join konstanz on st_contains(konstanz.way, p.way)
    WHERE p.building like 'cathedral'

)
select *
from  distance_uni_cathedral;


-- Q4.4
with konstanz_city as (
    SELECT *
    FROM planet_osm_polygon p
    WHERE name = 'Konstanz' AND admin_level = '8'
)
SELECT count(point.name) as bar_and_pub_count
FROM planet_osm_point point join konstanz_city on st_contains(konstanz_city.way, point.way)
WHERE (point.amenity like 'bar' or point.amenity like 'pub');

