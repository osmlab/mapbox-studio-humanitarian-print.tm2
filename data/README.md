`index.js` extracts certain tags from the Nepal pbf provided by geofabrik.

- You can edit the 'desired' variable to change which tags to pay attention to
- to run `node index.js`
- outputs line-delimited geojson, meant for [tippecanoe](https://github.com/mapbox/tippecanoe) to produce vector tiles and uploaded to mapbox.com
