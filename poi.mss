/* ================================================================== */
/* Points of interest
/* ================================================================== */

//generic maki icons
#poi_label[zoom=14][scalerank<=1],
#poi_label[zoom=15][scalerank<=2],
#poi_label[zoom=16][scalerank<=3],
#poi_label[zoom=17][scalerank<=4][localrank<=2],
#poi_label[zoom>=18] {
  // Separate icon and label attachments are created to ensure that
  // all icon placement happens first, then labels are placed only
  // if there is still room.
  ::icon[maki!=null] {
    // The [maki] field values match a subset of Maki icon names, so we
    // can use that in our url expression.
    // Not all POIs have a Maki icon assigned, so we limit this section
    // to those that do. See also <https://www.mapbox.com/maki/>
    marker-fill:#666;
    marker-file:url('icons/maki/[maki]-12.svg');
  }
  ::label {
    text-name: @name;
    text-face-name: @sans;
    text-size: 12;
    text-fill: #666;
    text-halo-fill: fadeout(#fff, 50%);
    text-halo-radius: 1;
    text-halo-rasterizer: fast;
    text-wrap-width: 70;
    text-line-spacing:	-1;
    //text-transform: uppercase;
    //text-character-spacing:	0.25;
    // POI labels with an icon need to be offset:
    [maki!=null] { text-dy: 8; }
  }
}

//HDM customized icons
#poi_label {
    [zoom>=10][zoom<15] {
        [type='Aerodrome'] {
            marker-file: url('icons/poi/airport-18.png');
            marker-clip:false;
            marker-ignore-placement: true;
         }
        [type='airfield'] {
            marker-file: url('icons/poi/[type]-18.png');
        }
    }
}