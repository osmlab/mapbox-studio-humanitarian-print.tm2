var osmium = require('osmium');

var file = new osmium.File(process.argv[2], 'pbf');
var reader = new osmium.Reader(file, {
    node: true,
    way: true
});
var location_handler = new osmium.LocationHandler();
var handler = new osmium.Handler();

var desired = [
    'amenity=fire_station',
    'emergency=*',
    'fire_hydrant:*',
    'amenity=public_building',
    'amenity=drinking_water',
    'office=*'
];

handler.on('node', filter);
handler.on('way', filter);

function filter(item) {
    var tags = item.tags();
    var keys = Object.keys(tags);
    keys.forEach(function(key) {
        var candidate = key + '=' + tags[key];

        if ((desired.indexOf(candidate) > -1) ||
            (desired.indexOf(key + '=*') > -1)) {
            var type = (item.coordinates !== undefined) ? 'node' : 'way';
            var properties = tags;
            properties[type + '_id'] = item.id;
            console.log(JSON.stringify({
                'type': 'Feature',
                'properties': tags,
                'geometry': item.geojson()
            }));
        }

    });
}

osmium.apply(reader, location_handler, handler);
