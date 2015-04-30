output.geojson: pbf out.mbtiles
	node index latest.osm.pbf > output.geojson

pbf:
	rm -rf latest.osm.pbf
	wget http://labs.geofabrik.de/nepal/latest.osm.pbf

out.mbtiles:
	tippecanoe -o out.mbtiles -n "Nepal - Updated $(date)" output.geojson
