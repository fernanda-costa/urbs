import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

const BASE_URL = "http://localhost:4000/pontos/linha/022";

@Injectable({
  providedIn: 'root'
})
export class PontosService {

  constructor(private httpClient: HttpClient) { }

  buscarPontosLinha(): Observable<any[]> {
    return this.httpClient.get<any[]>(`${BASE_URL}`);
  }


}
