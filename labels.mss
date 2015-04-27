/* LABELS.MSS CONTENTS:
 * - Place names
 * - POI labels
 * - Area labels
 * - Waterway labels
 * - Road labels
 * - Oneway arrows
 * - Admin labels
 * - Housenumbers
 */

/* Font sets are defined in palette.mss */

/* Mapnik does not yet support character-spacing adjustments for 
   labels placed along a line. We can fake this using the replace()
   function in the text-name parameter by replacing each character
   with itself followed by one or more spaces. */

/* ================================================================== */
/* LABLE NAME SETUP
/* ================================================================== */
@name: '[name]';

/* ================================================================== */
/* PLACE NAMES
/* ================================================================== */

/* ---- Countries --------------------------------------------------- */

#country_label[zoom>=3][zoom<=7] {
  text-name:@name;
  text-face-name:@sans_bold;
  text-placement:point;
  text-fill:@country_text;
  text-halo-fill: @country_halo;
  text-halo-radius: 1;
  [scalerank=0] { text-size: 14; }
  [scalerank=1] { text-size: 13; }
  [scalerank=2] { text-size: 12; }
  [scalerank=3] { text-size: 11; }
  [zoom=3] {
    text-size: 9;
    text-wrap-width: 40;
  }
  [zoom>=4] {
    text-size: 11;
    text-wrap-width: 50;
  }
  [zoom>=5] {
    text-halo-radius: 2;
    text-wrap-width: 50;
    text-line-spacing: 1;
  }
  [zoom=6] {
    text-size: 13;
    text-character-spacing: 1;
    text-wrap-width: 80;
    text-line-spacing: 2;
  }
  [zoom=7] {
    text-size: 14;
    text-character-spacing: 2;
  }
}

/* ---- States ------------------------------------------------------ */
#state_label[zoom>=5][zoom<=10] {
  text-name:@name;
  text-face-name:@sans_bold_italic;
  text-placement:point;
  text-fill:@state_text;
  text-halo-fill: @state_halo;
  text-halo-radius: 1;
  [area>=10000] { text-size: 14; }
  [area>=500000] { text-size: 16; }
  [area>=1000000] { text-size: 18; }
  [zoom=5] {
    text-size:9 + @text_adjust;
    text-wrap-width: 35;
  }
  [zoom=6] {
    text-size:10 + @text_adjust;
    text-wrap-width: 40;
  }
  [zoom=7] {
    text-size:11 + @text_adjust;
    text-wrap-width: 50;
  }
  [zoom>8] {
    text-halo-radius: 2;
  }
  [zoom=8] {
    text-size:11 + @text_adjust;
    text-wrap-width: 50;
    text-line-spacing: 1;
  }
  [zoom=9] {
    text-size:12 + @text_adjust;
    text-character-spacing: 1;
    text-wrap-width: 80;
    text-line-spacing: 2;
  }
  [zoom=10] {
    text-size:14 + @text_adjust;
    text-character-spacing: 2;
  }
}

/* ---- Cities and Towns ----------------------------------------------- */

#place_label[is_capital='country'][zoom>=4][zoom<=10],
#place_label[type='city'][zoom>=7][zoom<=10],
#place_label[type='town'][zoom>=9][zoom<=10] {
  shield-file: url('icons/place/town.png');
  [type='city'] {
    shield-file: url('icons/place/city.png');
  }
  [capital=2] {
    shield-file: url('icons/place/country_capital.png');
  }
  shield-name:@name;
  shield-size: 9;
  shield-face-name: @sans;
  shield-halo-radius: 1;
  shield-wrap-width: 50;
  shield-fill: @town_text;
  shield-halo-fill: @town_halo;
  shield-placement-type: simple;
  shield-placements: 'NE,SW,NW,SE,E,W';
  shield-text-dy: 3;
  shield-text-dx: 3;
  shield-unlock-image: true;
  shield-min-distance: 10;
  [type='city'] {
    shield-fill: @city_text;
    shield-halo-fill: @city_halo;
    shield-size: 10;
  }
  [is_capital='country'] {
    shield-face-name: @sans_bold;
    shield-fill: @capital_text;
    shield-halo-fill: @capital_halo;
    shield-size: 11;
    shield-line-spacing: -2;
    shield-text-dx: 4;
  }
  [zoom>=10] {
    shield-halo-radius: 2;
    shield-size: 10;
    [type='city'] { shield-size: 11;}
    [is_capital='country'] { shield-size: 11;}
  }
}

#place_label[type='city'][zoom>=11][zoom<=15],
#place_label[type='town'][zoom>=11][zoom<=17] {
  text-name:'[name]';
  text-size: 11;
  text-face-name: @sans;
  text-halo-radius: 2;
  text-wrap-width: 50;
  text-fill: @town_text;
  text-halo-fill: @town_halo;
  [type='city'] {
    text-fill: @city_text;
    text-halo-fill: @city_halo;
    text-size: 12;
  }
  [is_capital='country'] {
    text-face-name: @sans_bold;
    text-fill: @capital_text;
    text-halo-fill: @capital_halo;
    text-line-spacing: -2;
    text-transform: uppercase;
  }
  [zoom>=12]{
    text-size:12;
    [type='city'],
    [is_capital='country'] { text-size: 13;}
  }
  [zoom>=13]{
    text-transform: uppercase;
    text-character-spacing: 1;
    [type='city'],
    [is_capital='country'] { text-size: 14;}
  }
  [zoom>=14]{
    text-size:13;
    text-character-spacing: 2;
    [type='city'],
    [is_capital='country'] { text-size: 15;}
  }
  [zoom>=15]{
    text-size:14;
    text-character-spacing: 3;
    [type='city'],
    [is_capital='country'] { text-size: 16;}
  }
  [zoom>=16]{
    text-size:15;
    text-line-spacing: 5;
  }
  [zoom>=17]{
    text-size:16;
    text-line-spacing: 6;
  }
}



/* ---- Other small places ------------------------------------------ */

#place_label[type='village'][zoom>=11][zoom<=20],
#place_label[type='suburb'][zoom>=13][zoom<=20],
#place_label[type='hamlet'][zoom>=13][zoom<=20],
#place_label[type='neighbourhood'][zoom>=13][zoom<=20] {
  text-name:@name;
  text-face-name:@sans;
  text-placement:point;
  text-fill:@other_text;
  text-size:10;
  text-halo-fill:@other_halo;
  text-halo-radius:1;
  text-wrap-width: 30;
  text-min-distance: 100;
  text-avoid-edges: true;
  text-label-position-tolerance: 10;
  [zoom>=13] {
    text-min-distance: 50;
  }
  [zoom>=14] {
    text-size:11;
    text-character-spacing: 1;
    text-wrap-width: 40;
    text-line-spacing: 1;
  }
  [zoom>=15] {
    text-halo-radius: 2;
    text-transform: uppercase;
    text-character-spacing: 1;
    text-wrap-width: 60; 
    text-line-spacing: 1;
    text-min-distance: 30;
  }
  [zoom>=16] {
    text-size:12;
    text-character-spacing: 2;
    text-wrap-width: 120;
    text-line-spacing: 2;
    text-min-distance: 10;
  } 
  [zoom>=17] {
    text-size:13; 
    text-character-spacing: 3;
    text-wrap-width: 160;
    text-line-spacing: 4;
  }
  [zoom>=18] {
    text-size:14;
    text-character-spacing: 4;
    text-line-spacing: 6;
  }
}

#place_label[type='locality'][zoom>=15] {
  text-name:@name;
  text-face-name:@sans;
  text-placement:point;
  text-fill:@locality_text;
  text-size:9;
  text-halo-fill:@locality_halo;
  text-halo-radius:1;
  text-wrap-width: 30;
  [zoom>=16] {
    text-size:10;
    text-wrap-width: 60;
    text-line-spacing: 1;
  }
  [zoom>=17] {
    text-size:11;
    text-wrap-width: 120;
    text-line-spacing: 2;
  }
  [zoom>=18] {
    text-size:12;
    text-character-spacing: 1;
    text-line-spacing: 4;
  }
}


// =====================================================================
// POI LABELS
// =====================================================================

// moved to poi.mss

// =====================================================================
// AREA LABELS
// =====================================================================

// Unsupported in MapBox Streets

/* ================================================================== */
/* WATERWAY LABELS
/* ================================================================== */

#waterway_label[type='river'][zoom>=13],
#waterway_label[type='canal'][zoom>=15],
#waterway_label[type='stream'][zoom>=17] {
  text-name: @name;
  text-face-name: @sans_italic;
  text-fill: darken(@water,20%);
  text-halo-fill: @other_halo;
  text-halo-radius: 1;
  text-placement: line;
  text-min-distance: 400;
  text-size: 10;
  text-dy: 7;
  [type='river'][zoom=14],
  [type='canal'][zoom=16],
  [type='stream'][zoom=18] {
    text-name: "@name.replace('([\S\ ])','$1 ')";
  }
  [type='river'][zoom=15],
  [type='canal'][zoom=17] {
    text-size: 11;
    text-name: "@name.replace('([\S\ ])','$1 ')";
  }
  [type='river'][zoom>=16],
  [type='canal'][zoom>=18] {
    text-size: 14;
    text-name: "@name.replace('([\S\ ])','$1 ')";
    text-spacing: 300;
  }
}

/* ================================================================== */
/* ROAD LABELS
/* ================================================================== */

// highway shield
#road_label[class='motorway'][zoom>=8][reflen>=1][reflen<=6],
#road_label[class='main'][zoom>=8][reflen>=1][reflen<=6] {
  shield-name: "[ref]";
  shield-file: url("icons/shield/motorway_sm_[reflen].png");
  shield-size: 9;
  shield-face-name: @sans_bold;
  shield-fill: #fff;
  shield-spacing: 300;
  shield-avoid-edges: true;
  shield-min-padding: 10;
  shield-min-distance: 40;
  [zoom>=12] { shield-min-distance: 80; }
  [zoom>=15] {
    shield-spacing: 400;
    shield-size: 11;
    shield-file: url("icons/shield/motorway_sm_[reflen].png");
  }
}

#road_label['mapnik::geometry_type'=2] {
  [class='motorway'],
  [class='main'][zoom>=12],
  [class='street'][zoom>=15],
  [class='street_limited'][zoom>=16],
  [class='service'][zoom>=17] {
  text-name:@name;
  text-face-name:@sans_bold;
  text-placement:line;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1;
  text-min-distance:60;
  text-size:10;
  text-avoid-edges: true;
  [zoom=11] { text-min-distance:70; }
  [zoom=12] { text-min-distance:80; }
  [zoom=13] { text-min-distance:100; }
  }
}

/* ================================================================== */
/* ONE-WAY ARROWS
/* ================================================================== */

#road[oneway=1] {
  marker-placement:line;
  marker-max-error: 0.5;
  marker-spacing: 200;
  marker-file: url('icons/oneway.svg');
  [oneway=-1] { marker-file: url('icons/oneway-reverse.svg'); }
  [zoom=16] { marker-transform: "scale(0.5)"; }
  [zoom=17] { marker-transform: "scale(0.75)"; }
}

/* ================================================================== */
/* HOUSENUMBERS
/* ================================================================== */


#housenum_label[zoom>=17]{
  text-name: [house_num];
  text-placement: interior;
  text-face-name: @sans;
  text-fill: @road_text;
  text-size: 7;
  [zoom=17][mod5='no'] {
    text-name: "";
  }
  [zoom >= 18] {
    text-size: 9;
  }
}

/* ================================================================== */
/* NATURAL
/* ================================================================== */

/*#natural_point_label[type='bay'][zoom>=10] {
  text-name: '[name]';
  text-face-name: @sans_italic;
  text-fill: darken(@water,30%);
  text-halo-fill: lighten(@water,10%);
  text-halo-radius: 1;
  text-size: 11;
}

#natural_point_label[type='volcano'][zoom>=13],
#natural_point_label[type='peak'][zoom>=13] {
  shield-file: url('icons/natural/peak-6.png');
  shield-name: '[name]';
  shield-face-name: @sans_lt_italic;
  shield-fill: @peak;
  shield-size: 10;
  shield-min-distance: 50;
  shield-text-dy: 6;
  shield-text-dx: 6;
  shield-halo-fill: @other_halo;
  shield-halo-radius: 1;
  shield-placement-type: simple;
  shield-placements: 'S,N,E,W';
  shield-unlock-image: true;
  [ele!=null] {
    shield-name: '[name] + " (" + [ele] + ")"';
  }
}*/
