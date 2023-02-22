import { Component, OnInit } from '@angular/core';
import { PontosService } from '../services/pontos.service';

@Component({
  selector: 'app-pontos-lista',
  templateUrl: './pontos-lista.component.html',
  styleUrls: ['./pontos-lista.component.scss']
})
export class PontosListaComponent implements OnInit  {

  pontos: any;

  constructor(private pontosService: PontosService) {}

  ngOnInit(): void {
    this.pontosService.buscarPontosLinha().subscribe((pontos: any[]) => {
      this.pontos = pontos.slice(0, 5);
      console.log(this.pontos)
    })
  }

}
