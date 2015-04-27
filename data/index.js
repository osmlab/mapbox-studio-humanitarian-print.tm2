var osmium = require('osmium');

var file = new osmium.File('nepal.latest.osm.pbf', 'pbf');

var reader = new osmium.Reader(file, {
    node: true,
    way: true
});
var location_handler = new osmium.LocationHandler();
var handler = new osmium.Handler();

var desired = {
    'highway': 'track',
    'aeroway': 'terminal'
};
var desiredKeys = Object.keys(desired);

handler.on('node', filter);
handler.on('way', filter);

function filter(item) {
    var tags = item.tags();
    var keys = Object.keys(tags);
    keys.forEach(function(key) {
        if ((desiredKeys.indexOf(key) > -1) &&
            (desired[key] == tags[key])) {
            console.log(JSON.stringify({
                'type': 'Feature',
                'properties': tags,
                'geometry': item.geojson()
            }));
        }
    });
}

osmium.apply(reader, location_handler, handler);
