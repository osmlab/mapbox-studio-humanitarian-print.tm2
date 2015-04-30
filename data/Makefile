out.mbtiles: output.geojson
	tippecanoe -o out.mbtiles -n "Nepal - Updated $(date)" output.geojson

output.geojson: pbf
	nodejs index latest.osm.pbf > output.geojson

pbf:
	rm -rf latest.osm.pbf
	wget http://labs.geofabrik.de/nepal/latest.osm.pbf
