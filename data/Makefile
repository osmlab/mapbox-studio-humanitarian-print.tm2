output.geojson: tippecanoe pbf out.mbtiles
	node index latest.osm.pbf > output.geojson

pbf:
	rm -rf latest.osm.pbf
	wget http://labs.geofabrik.de/nepal/latest.osm.pbf

tippecanoe:
	apt-get install libprotobuf-dev protobuf-compiler libsqlite3-dev
	git clone https://github.com/mapbox/tippecanoe.git
	cd tippecanoe
	make
	make install

out.mbtiles:
	tippecanoe -o out.mbtiles -n nepal output.geojson
