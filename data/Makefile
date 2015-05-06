upload: out.mbtiles
	/bin/echo "--------------------------------------------------"
	/bin/echo $(date)
	node upload.js out.mbtiles kll <properly scoped accesstoken here> kll.ewomvx6r

out.mbtiles: output.geojson
	rm -rf out.mbtiles
	tippecanoe -o out.mbtiles -n "Nepal - Updated `date`" -l nepal output.geojson

output.geojson: pbf
	node index.js latest.osm.pbf > output.geojson

pbf:
	rm -rf latest.osm.pbf
	wget http://labs.geofabrik.de/nepal/latest.osm.pbf
