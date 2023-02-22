import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';

const BASE_URL = "http://localhost:4000/linhas/shape/022";

@Injectable({
  providedIn: 'root'
})
export class LinhasService {

  constructor(private httpClient: HttpClient) { }
  getLinhas() {
    return this.httpClient.get(`${BASE_URL}`)
  }

}
