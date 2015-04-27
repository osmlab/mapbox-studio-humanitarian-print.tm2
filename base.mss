/* BASE.MSS CONTENTS
 * - Landuse & landcover
 * - Buildings
 * - Relief
 * - Water areas
 * - Water ways
 * - Administrative boundaries
 * - Barrier points
 * - Barrier lines
 */

/* ================================================================== */
/* LANDUSE & LANDCOVER
/* ================================================================== */

Map {
  background-color: @land;
}

#landuse[zoom>3][zoom<=9],
#landuse[zoom>9][zoom<=12],
#landuse[zoom>12] {
  [class='cemetery']     { polygon-fill: @cemetery; }
  [class='industrial']   { polygon-fill: @industrial; }
  [class='hospital']     { polygon-fill: @hospital; }
  [type='industrial']    { polygon-fill: @industrial; }
  [type='residential']   { polygon-fill: @residential; } /*needs support in MB Streets */
  [type='pitch']         { polygon-fill: @sports; polygon-opacity: 0.8; }
  [type='park']          { polygon-fill: @park; }
  [type='wood']          { polygon-fill: @wooded; }
  [type='scrub']         { polygon-fill: @heath; }
  [type='agriculture']   { polygon-fill: @agriculture; }
  [type='sand']        {
    polygon-fill: @beach;
    polygon-opacity: 0.3;
    [zoom>=9] {
      polygon-opacity: 0.5;
    }
    [zoom>=11] {
      polygon-opacity: 0.5;
    }
    [zoom>=14] {
      polygon-opacity: 0.7;
    }
    [zoom>=16] {
      polygon-opacity: 0.8;
    }
  }
}

#landcover {
  [type='wood'] { polygon-fill: @wooded }
  [type='scrub'] { polygon-fill: @heath }
  [type='grass'] { polygon-fill: @grass }
  [type='crop'] { polygon-fill: @agriculture; }
}

#landuse_overlay[class='wetland'] {
    [zoom<14] {
      polygon-fill: @wetland;
    }
    [zoom>=14] {
      polygon-pattern-file:url('icons/pattern/marsh-36.png');
    }
  }

/* ================================================================== */
/* BUILDINGS
/* ================================================================== */

#building[zoom>=14] {
  polygon-fill: @building;
  line-color: darken(@building, 5%);
  line-width: 0.2;
  [poi='yes'] {
    polygon-fill: darken(@building, 5%);
    line-color: darken(@building, 10%);
  }

  [zoom>=16] {
    line-color:darken(@building,10%);
    line-width: 0.4;
    [poi='yes'] {
      line-color: darken(@building, 15%);
    }
  }

  [zoom>=18] {
    line-color:darken(@building,20%);
  }

}


/* ================================================================== */
/* HILLSHADE & RELIEF
/* ================================================================== */
// Hillshading //

#hillshade {
  ::0[zoom<=13],
  ::1[zoom=14],
  ::2[zoom>=15][zoom<=16],
  ::3[zoom>=17][zoom<=18],
  ::4[zoom>=19] {
    comp-op: hard-light;
    polygon-clip: false;
    image-filters-inflate: true;
    [class='full_shadow'] {
      polygon-fill: #103;
      polygon-opacity: 0.08;
      [zoom>=15][zoom<=16] { polygon-opacity: 0.075; }
      [zoom>=17][zoom<=18] { polygon-opacity: 0.05; }
      [zoom>=18] { polygon-opacity: 0.025; }
    }
    [class='medium_shadow'] {
      polygon-fill: #206;
      polygon-opacity: 0.08;
      [zoom>=15][zoom<=16] { polygon-opacity: 0.075; }
      [zoom>=17][zoom<=18] { polygon-opacity: 0.05; }
      [zoom>=18] { polygon-opacity: 0.025; }
    }
    [class='medium_highlight'] {
      polygon-fill: #ffb;
      polygon-opacity: 0.2;
      [zoom>=15][zoom<=16] { polygon-opacity: 0.3; }
      [zoom>=17][zoom<=18] { polygon-opacity: 0.2; }
      [zoom>=18] { polygon-opacity: 0.1; }
    }
    [class='full_highlight'] {
      polygon-fill: #ffd;
      polygon-opacity: 0.25;
      [zoom>=15][zoom<=16] { polygon-opacity: 0.3; }
      [zoom>=17][zoom<=18] { polygon-opacity: 0.2; }
      [zoom>=18] { polygon-opacity: 0.1; }
    }
  }
  ::1 { image-filters: agg-stack-blur(2,2); }
  ::2 { image-filters: agg-stack-blur(8,8); }
  ::3 { image-filters: agg-stack-blur(16,16); }
  ::4 { image-filters: agg-stack-blur(32,32); }
}

// Elevation contours & labels //

// Multiple copies of the same layer have been made, each with
// unique classes and positions in the stack. This is done by
// editing the layers list in <project.yml>.

#contour.line::line {
  line-color: @contour_line;
  line-opacity: 0.1;
  line-width: 1.2;
  [index>=5] {
    line-opacity: 0.2;
    line-width: 1.2;
  }
}

#contour.label::label[ele!=0] {
  [zoom<=12][index>=5],
  [zoom>=13][zoom<=15][index=10],
  [zoom>=16][index>=5] {
    text-name: "[ele]";
    text-face-name: @sans_lt;
    text-placement: line;
    text-fill: @contour_line;
    text-halo-fill: fadeout(@land,80%);
    text-halo-radius: 2;
    text-halo-rasterizer: fast;
    text-avoid-edges: true;
  }
}


/* ================================================================== */
/* WATER AREAS
/* ================================================================== */

Map {
  background-color: @water;
  buffer-size: 256;
}

#water_gen0[zoom>3][zoom<=9],
#water_gen1[zoom>9][zoom<=12],
#water[zoom>12] {
  polygon-fill: @water;
}

/* ================================================================== */
/* WATER WAYS
/* ================================================================== */

#water {
  polygon-clip: false;
  polygon-fill: @water;
  ::blur {
    // A second attachment that is blurred creates the effect of
    // an inline stroke on the water layer.
    image-filters: agg-stack-blur(1,1);
    image-filters-inflate: true;
    polygon-clip: false;
    polygon-fill: @water;
    polygon-gamma: 0.6;
    [zoom<6] { polygon-gamma: 0.4; }
  }
}

#waterway {
  [type='river'],
  [type='canal'] {
    line-color: @water;
    line-width: 0.5;
    [zoom>=12] { line-width: 1; }
    [zoom>=14] { line-width: 2; line-cap: round; line-smooth: 0.5; }
    [zoom>=16] { line-width: 3; }
  }
  [type='stream'] {
    line-color: @water;
    line-width: 0.25;
    [zoom>=14] { line-width: 1; line-smooth: 0.5; }
    [zoom>=16] { line-width: 1.5; line-cap: round; }
    [zoom>=18] { line-width: 2; }
  }
}

/* ================================================================== */
/* ADMINISTRATIVE BOUNDARIES
/* ================================================================== */


#admin {
  line-join: round;
  line-color: #88a;
  [maritime=1] { line-color: darken(@water, 3%); }
  // Countries
  [admin_level=2] {
    [zoom=2] { line-width: 0.4; }
    [zoom=3] { line-width: 0.8; }
    [zoom=4] { line-width: 1; }
    [zoom=5] { line-width: 1.5; }
    [zoom>=6] { line-width: 2; }
    [zoom>=8] { line-width: 3; }
    [zoom>=10] { line-width: 4; }
    [disputed=1] { line-dasharray: 4,4; }
  }
  // States / Provices / Subregions
  [admin_level>=3] {
    line-width: 0.4;
    line-dasharray: 10,3,3,3;
    [zoom>=6] { line-width: 1; }
    [zoom>=8] { line-width: 2; }
    [zoom>=12] { line-width: 3; }
  }
}

/* ================================================================== */
/* BARRIER POINTS
/* ================================================================== */


.barriers[zoom>=17][barrier = 'divider'] {
  marker-height: 2;
  marker-fill: #c7c7c7;
  marker-line-opacity:0;
  marker-allow-overlap:true;
}

/* ================================================================== */
/* BARRIER LINES
/* ================================================================== */

.barriers[zoom>=17][barrier = 'gate'] {
  line-width:2.5;
  line-color:#aab;
  line-dasharray:3,2;
}

.barriers[zoom>=17][barrier = 'fence'] {
  line-width:1.75;
  line-color:#aab;
  line-dasharray:1,1;
}

.barriers[zoom>=16][barrier='hedge'] {
  ::alternate {
    line-color: @park;
  }
  line-width:2;
  line-color:darken(@park,15%);
  line-dasharray:2,4;
  line-cap: round;
  [zoom=16] {
    line-width: 1;
  }
}

.barriers[zoom>=16][barrier = 'wall'] {
  line-width:1;
  line-color: darken(@land,25%);
}