var upload = require('mapbox-upload');
var arg = process.argv;

if (!argv[5]) return console.log('usage: node upload.js <file> <account> <accesstoken> <mapid>');

progress = upload({
    file: process.argv[2],
    account: process.argv[3],
    accesstoken: process.argv[4], // A valid Mapbox API secret token with the map:write scope enabled.
    mapid: process.argv[5]
});

progress.on('error', function(err){   
    if (err) throw err;
});

progress.on('progress', function(p){
    console.log(p.percentage);
});

progress.once('finished', function(){   
    // Upload has completed but is likely queued for processing and not yet available on Mapbox.
    console.log('upload successful and processing on mapbox.com');
});
