import { Component, OnInit, ViewChild } from '@angular/core';
import { interval } from 'rxjs';
import { LinhasService } from '../services/linhas.service';
import { VeiculosService } from '../services/onibus.service';

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


  markers: google.maps.Marker[] = [];


  constructor(
    private linhasService: LinhasService,
    private onibusService: VeiculosService
  ) { }

  ngOnInit() {
    this.linhasService.getLinhas().subscribe((e: any) => {
      console.log(e)
      this.linhas = e;

      this.shape = e.map((e: any) => { return { lat: Number(e.latitude), lng: Number(e.longitude) } })

      const mapProperties = {
        center: new google.maps.LatLng(this.shape[0].lat, this.shape[0].lng),
        zoom: 13,
      };
      this.map = new google.maps.Map(
        this.mapElement.nativeElement,
        mapProperties
      );

      const shapeMapa = new google.maps.Polyline({
        path: this.shape,
        geodesic: true,
        strokeColor: "#FF0000",
        strokeOpacity: 1.0,
        strokeWeight: 2,
      });

      shapeMapa.setMap(this.map);
    })

    this.buscarLocalizacaoAtualOnibus();
    interval(120000)
      .subscribe(() => { this.buscarLocalizacaoAtualOnibus(); });
    ;
  }

  private buscarLocalizacaoAtualOnibus() {
    this.onibusService.getLocalizacaoAtual().subscribe((veiculos: any) => {
      console.log(veiculos)
      this.deleteMarkers();
      veiculos.forEach((veiculo: any) => {
        const marker = new google.maps.Marker({
          position: new google.maps.LatLng(veiculo.latitude, veiculo.longitude),
          title: "Hello World!",
          icon: {
            path: 'M12.45 42q-.65 0-1.15-.375-.5-.375-.5-.975v-4.2q-1.45-.8-2.125-2.3Q8 32.65 8 30.95V11.1q0-3.7 3.825-5.4Q15.65 4 24.05 4q8.3 0 12.125 1.7Q40 7.4 40 11.1v19.85q0 1.7-.675 3.2-.675 1.5-2.125 2.3v4.2q0 .6-.5.975T35.55 42h-.95q-.7 0-1.2-.375t-.5-.975V37.9H15.1v2.75q0 .6-.5.975T13.4 42ZM11 21.45h26V12.8H11Zm5.3 10.95q1.15 0 1.95-.8t.8-1.95q0-1.15-.8-1.95t-1.95-.8q-1.15 0-1.95.8t-.8 1.95q0 1.15.8 1.95t1.95.8Zm15.4 0q1.15 0 1.95-.8t.8-1.95q0-1.15-.8-1.95t-1.95-.8q-1.15 0-1.95.8t-.8 1.95q0 1.15.8 1.95t1.95.8Z',
            fillColor: '#808080',
            fillOpacity: 1.0,
            scale: 1,
            size: new google.maps.Size(71, 71),
          },
        });

        this.markers.push(marker);
        this.setMapOnAll(this.map);
      });
    })
  }

  // Sets the map on all markers in the array.
  setMapOnAll(map: google.maps.Map | null) {
    for (let i = 0; i < this.markers.length; i++) {
      this.markers[i].setMap(map);
    }
  }

  // Removes the markers from the map, but keeps them in the array.
  hideMarkers(): void {
    this.setMapOnAll(null);
  }

  // Shows any markers currently in the array.
  showMarkers(): void {
    this.setMapOnAll(this.map);
  }

  // Deletes all markers in the array by removing references to them.
  deleteMarkers(): void {
    this.hideMarkers();
    this.markers = [];
  }
}
