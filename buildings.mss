// ---------------------------------------------------------------------
// Buildings data

@building-fill: #323232;//#767676;
@roof: lighten(#c7c5c5,3);//lighten(#eee,3);
@wall: darken(#aeadad,15);//darken(#ccc,15);

#nepal {
  
  // Sub-layer "Attachment" for buildings added with custom data
  
  ::building[zoom>=15][building!='yes'] {
    polygon-fill: @building-fill;
    opacity: 0.25;
    [zoom>=16] {
      ::wall { polygon-fill: @wall;  }
      ::roof {
        polygon-fill: @roof;
        polygon-geometry-transform:translate(-1,-1);
        polygon-clip:false;  
        line-width: 0.25;
        line-color: mix(@land, #000, 85);
        line-geometry-transform:translate(-1,-1);
        line-clip:false;
        [zoom>=17] { line-width:0.5; }
        [zoom>=18] {
          polygon-geometry-transform:translate(-1,-2);
          line-geometry-transform:translate(-1,-2);
          line-width:0.75;
          }
        }
      }
    }
  
    // Sub-layer for custom data's building labels 

  ::building_label[zoom>=16] {
    [building!='yes'] {
    text-name: @name;
    text-face-name: @sans_bd;
    text-size: 10;
    text-margin:1;
    text-fill: darken(@buildings,30);
    text-halo-fill: fadeout(#fff, 50%);
    text-halo-radius: 1;
    text-halo-rasterizer: fast;
    text-wrap-width: 35;
    text-line-spacing:-4;
      [zoom=16] { text-size: 8; }
      }
    }
  }

/**/
// ---------------------------------------------------------------------
// Mapbox Streets buildings

#building [zoom<=17]{
  // At zoom level 13, only large buildings are included in the
  // vector tiles. At zoom level 14+, all buildings are included.
  polygon-fill: @building-fill;
  opacity: 0.25;
}
// Seperate attachments are used to draw buildings with depth
// to make them more prominent at high zoom levels
#building [zoom>=16]{
::wall { polygon-fill: @wall; }
::roof {
  polygon-fill: @roof;
  polygon-geometry-transform:translate(-1,-1);
  polygon-clip:false;  
  line-width: 0.25;
  line-color: mix(@land, #000, 85);
  line-geometry-transform:translate(-1,-1);
  line-clip:false;
  [zoom>=17] {
    line-width:0.5;
  }
    [zoom>=18] {
      polygon-geometry-transform:translate(-1,-2);
        line-geometry-transform:translate(-1,-2);
      line-width:0.75;
    }
 }
}

/**/