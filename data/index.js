var osmium = require('osmium');

var file = new osmium.File('nepal.latest.osm.pbf', 'pbf');

var reader = new osmium.Reader(file, {
    node: true,
    way: true
});
var location_handler = new osmium.LocationHandler();
var handler = new osmium.Handler();

var desired = [
    'highway=track',
    'aeroway=terminal'
];

handler.on('node', filter);
handler.on('way', filter);

function filter(item) {
    var tags = item.tags();
    var keys = Object.keys(tags);
    keys.forEach(function(key) {
        var candidate = key + '=' + tags[key];
        if (desired.indexOf(candidate) > -1) {
            console.log(JSON.stringify({
                'type': 'Feature',
                'properties': tags,
                'geometry': item.geojson()
            }));
        }
    });
}

osmium.apply(reader, location_handler, handler);
