pbf:
	rm -rf latest.osm.pbf
	wget http://labs.geofabrik.de/nepal/latest.osm.pbf

update: pbf
	node index latest.osm.pbf > nepal.geojson
	