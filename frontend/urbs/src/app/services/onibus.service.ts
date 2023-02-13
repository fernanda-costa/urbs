import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

const BASE_URL = "http://localhost:4000/veiculos/linha/:id";

@Injectable({
  providedIn: 'root'
})
export class VeiculosService {

  constructor(private httpClient: HttpClient) { }

  getLocalizacaoAtual() {
    return this.httpClient.get(`${BASE_URL}`)
  }
}
