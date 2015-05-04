out.mbtiles: output.geojson
	rm -rf out.mbtiles
	tippecanoe -o out.mbtiles -l "Nepal - Updated `date`" -n nepal output.geojson

output.geojson: pbf
	node index.js latest.osm.pbf > output.geojson

pbf:
	rm -rf latest.osm.pbf
	wget http://labs.geofabrik.de/nepal/latest.osm.pbf
