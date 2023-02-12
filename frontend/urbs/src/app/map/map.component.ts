import { Component, OnInit, ViewChild } from '@angular/core';
import { MapInfoWindow, MapMarker } from '@angular/google-maps';
import { LinhasService } from '../services/linhas.service';

@Component({
  selector: 'app-map',
  templateUrl: './map.component.html',
  styleUrls: ['./map.component.scss']
})
export class MapComponent implements OnInit {
    @ViewChild("map", { static: true }) mapElement: any;
    map: any;
  
    linhas: any;
    shape: any;

    constructor(private linhasService: LinhasService) {}
  
    ngOnInit() {
      this.linhasService.getLinhas().subscribe((e: any) => {
        this.linhas = e;
        
        console.log(e.filter((e: any) => e.ITINERARY_ID = 694).sort((n1: any, n2: any) => n1.SEQ - n2.SEQ))
        this.shape = e.filter((e: any) => e.ITINERARY_ID = 694).sort((n1: any, n2: any) => n1.SEQ - n2.SEQ).map((e:any) => 
        { return { lat: Number(e.LAT.replace(',', '.')), lng: Number(e.LON.replace(',', '.')) }})


        const mapProperties = {
          center: new google.maps.LatLng(this.shape[0].lat, this.shape[0].lng),
          zoom: 15,
        };
        this.map = new google.maps.Map(
          this.mapElement.nativeElement,
          mapProperties
        );
  
        const shapeMapa = new google.maps.Polyline({
          path:  this.shape,
          geodesic: true,
          strokeColor: "#FF0000",
          strokeOpacity: 1.0,
          strokeWeight: 2,
        });
      
        shapeMapa.setMap(this.map);
      })
    }
  }