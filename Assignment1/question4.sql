SELECT name , ST_Area( way :: geography )/(1000*1000) as area_sqkm
FROM planet_osm_polygon
WHERE name = 'Landkreis Konstanz' AND admin_level = '6';