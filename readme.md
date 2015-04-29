# Print maps for humanitarian response

[Mapbox Studio](https://www.mapbox.com/mapbox-studio) styles and additional data for print maps, intended to be used in humanitarian response scenarios. Easy to repurpose for similar use cases.

This project consists of a print style for Mapbox Studio and [way to download additional point of interest data](https://github.com/osmlab/mapbox-studio-humanitarian-print.tm2/tree/master/data) usually not available in Mapbox Streets, the standard OpenStreetMap based source in Mapbox Studio.

The map style highlights certain humanitarian points-of-interest.

## Rendered map

[Preview map](https://api.tiles.mapbox.com/v4/kll.ptthjjor/page.html?access_token=pk.eyJ1Ijoia2xsIiwiYSI6IktVRUtfQnMifQ.GJAHJPvusgK_f0NsSXS8QA#8/28.580/84.034) 

Style mapID: **kll.ptthjjor**
Source mapID: **kll.ewomvx6r**

## Background

This style was created as part of the [2015 Nepal Earthquake response](http://wiki.openstreetmap.org/wiki/2015_Nepal_earthquake). You can find maps ready to print based on this style on [Kathmandu Living Labs' Quake Maps page](to http://kathmandulivinglabs.github.io/quake-maps/).

## Studio files

This stylesheet can be used in Mapbox Studio, [following these instructions](https://www.mapbox.com/help/github-style/)

Instructions for updating the data can be found in the [README in the data directory](https://github.com/osmlab/mapbox-studio-humanitarian-print.tm2/tree/master/data)

## Places 

Bookmark target locations usings Places functionality in Studio. Makes print export and data checking easier. Press heart icon to save location or edit directly `bookmarks.yml` in text editor with Studio. Restart Studio when making manual edits.

### Locations saved:

[Kalinchok, Kuri Village, Central Region, Nepal](https://api.tiles.mapbox.com/v4/kll.ptthjjor/page.html?access_token=pk.eyJ1Ijoia2xsIiwiYSI6IktVRUtfQnMifQ.GJAHJPvusgK_f0NsSXS8QA#17/27.74714/86.03230)
![kuri_z17](https://cloud.githubusercontent.com/assets/4587826/7359571/b010b5d0-ed0d-11e4-8471-80364a0a042e.png)

[Bahrabise, Central Region, Nepal](https://api.tiles.mapbox.com/v4/kll.ptthjjor/page.html?access_token=pk.eyJ1Ijoia2xsIiwiYSI6IktVRUtfQnMifQ.GJAHJPvusgK_f0NsSXS8QA#14/27.7970573/85.9195447)
![bhaktapur_z16](https://cloud.githubusercontent.com/assets/4587826/7359618/58ae6142-ed0e-11e4-80ee-5d4390086f04.png)

[Charikot, Bhimeshwor Municipality, Nepal](https://api.tiles.mapbox.com/v4/kll.ptthjjor/page.html?access_token=pk.eyJ1Ijoia2xsIiwiYSI6IktVRUtfQnMifQ.GJAHJPvusgK_f0NsSXS8QA#16/27.6667/86.0529)
![charikot_z16](https://cloud.githubusercontent.com/assets/4587826/7359627/82e96402-ed0e-11e4-995c-df9f98b2ce55.png)

[Laprak, Nepal](https://api.tiles.mapbox.com/v4/kll.ptthjjor/page.html?access_token=pk.eyJ1Ijoia2xsIiwiYSI6IktVRUtfQnMifQ.GJAHJPvusgK_f0NsSXS8QA#15/28.2119/84.8069)
![laprak_z15](https://cloud.githubusercontent.com/assets/4587826/7359646/ac16df4e-ed0e-11e4-8b7e-02dc6219e8b8.png)

[Barpak, Nepal](https://api.tiles.mapbox.com/v4/kll.ptthjjor/page.html?access_token=pk.eyJ1Ijoia2xsIiwiYSI6IktVRUtfQnMifQ.GJAHJPvusgK_f0NsSXS8QA#16/28.2016/84.7448)
![barpak_z15](https://cloud.githubusercontent.com/assets/4587826/7359664/f225b76c-ed0e-11e4-9711-9932747b51f3.png)

### CartoCSS Styling

`.tm2` style file is included in this repo for further styling and data updates. Please look to the following Studio guides and documentation as you style your map. Feel free to email us with specific questions as well.

 - [Styling Manual](https://www.mapbox.com/guides/style-manual/)
 - [CartoCSS in Studio](https://www.mapbox.com/guides/cartocss-in-studio/)

## Print export

Print sizes: A4 size 8.27 x 11.69" (21.0 x 29.7cm) 
Oversize output: 17.5 x 24"

 - [Printing maps in Studio](https://www.mapbox.com/guides/print/)


