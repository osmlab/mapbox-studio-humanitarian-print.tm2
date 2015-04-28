// ---------------------------------------------------------------------
// Points of interest

@buildings: gray;
@drinkingwater: #3da2f2;
@fire: #b74c4c;
@labels: lime;
@hospital: #d2ade6;

#nepal[amenity!='public_building'] {
  ::icon {
    // uncomment next 3 lins to show data not filtered in this layer
    //marker-fill: black;
    //marker-height:10;
    //marker-allow-overlap: true;
    [office='government'][building='yes'],
      [amenity='prison'],
      [office!=''], [building='hospital'],
      [emergency!=''] {   
      // filter custom data to show no icon 
      marker-opacity: 0;
      }
    
    // filter custom data to show amenity specific icons
    [amenity='drinking_water'] {
      marker-fill: @drinkingwater;
      marker-height:8;
      marker-file: url('icon/water-12.svg');
      //marker-allow-overlap: true;
      [zoom>=17] { marker-height:12; }
     }
    [amenity='fire_station'] {
      marker-fill: @fire;
      marker-height:12;
      marker-file: url('icon/fire-station-12.svg');
      //marker-allow-overlap: true;
      }
    [amenity='hospital'] {
      marker-fill: @hospital;
      marker-height: 12;
      marker-file: url('icon/hospital-12.svg');
      //marker-allow-overlap: true;
      }
    }

  ::label[zoom>=18][amenity!='public_building'][building!='yes'] {
    
    // show labels for custom data not tagged as buildings
   
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
    [amenity='fire_station'] {
      text-fill: @fire;
      text-dy:6;
      text-size: 10;
      }
    [amenity='drinking_water'] {
      text-fill: @drinkingwater;
      text-dy:6;
      text-size: 10;
     }
    [zoom>=19] {
      text-wrap-width: 45;
      text-allow-overlap: true;
      }
    }
  }
  