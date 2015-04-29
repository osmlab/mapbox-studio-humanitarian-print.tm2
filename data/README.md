# Additional data

Extracts point of interest data not avilable in standard Mapbox Streets vector tiles. The point of interest data is extracted from OpenStreetMap and converted into GeoJSON, ready to be further processed into vector tiles with Tippecanoe. The vector tiles can then be used in Mapbox Studio together with the regular OpenStreetMap based Mapbox Streets vector tiles.

Below are instructions to generate the map data yourself. If you are looking for a map id, ready to use in your [Mapbox Studio](https://www.mapbox.com/mapbox-studio) project, use this: **kll.ewomvx6r**


## Usage

`index.js` is a script which extracts OSM objects with certain tags from the Nepal pbf provided by geofabrik.

It will output line-delimited GeoJSON, which can be fed into [tippecanoe](https://github.com/mapbox/tippecanoe) to produce vector tiles. Those vector tiles can then be uploaded to Mapbox.com via the upload form at https://www.mapbox.com/uploads/?source=data.

- You can edit the 'desired' variable in `index.js` to change which tags are used to filter items by
- to use, first `npm install`, then `node index.js *<your pbf file>*`
- currently Geofabrik is updating Nepal specific extracts which can be acquired here: https://wiki.openstreetmap.org/wiki/2015_Nepal_earthquake#Exporting_OpenStreetMap_data
- this will output GeoJSON, to save it to a file, pipe it, like so: `node index.js *<your pbf file>* > output.geojson`
- then you can use [tippecanoe](https://github.com/mapbox/tippecanoe) to convert that GeoJSON file to vector tiles, `tippecanoe -o out.mbtiles -n nepal output.geojson`
- upload `out.mbtiles` to your account at https://www.mapbox.com/uploads/?source=data

Once you have vector tiles in your account on Mapbox.com you can style them in Mapbox studio, using the style provided in this repository. [This guide](https://www.mapbox.com/help/github-style/) will help you set up this style yourself.
