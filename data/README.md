`index.js` is a script which extracts OSM objects with certain tags from the Nepal pbf provided by geofabrik.

It will output line-delimited GeoJSON, which can be fed into [tippecanoe](https://github.com/mapbox/tippecanoe) to produce vector tiles. Those vector tiles can then be uploaded to Mapbox.com via the upload form at http://mapbox.com/data.

- You can edit the 'desired' variable in `index.js` to change which tags are used to filter items by
- to use, first `npm install`, then `node index.js`
    - it will look for the file `nepal.latest.osm.pbf`, which can be acquired here: https://wiki.openstreetmap.org/wiki/2015_Nepal_earthquake#Exporting_OpenStreetMap_data
    - this will output GeoJSON, to save it to a file, pipe it, like so: `node index.js > output.geojson`
    - then you can use [tippecanoe](https://github.com/mapbox/tippecanoe) to convert that GeoJSON file to vector tiles, `tippecanoe -o out.mbtiles -n Nepal output.geojson`
    - upload `out.mbtiles` to your account at http://mapbox.com/data
