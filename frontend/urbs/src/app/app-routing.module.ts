import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MapComponent } from './map/map.component';
import { PontosListaComponent } from './pontos-lista/pontos-lista.component';

const routes: Routes = [
  {
    path: '',
    component: MapComponent
  },
  {
    path: 'pontos',
    component: PontosListaComponent
  },
  {
    path: 'indicadores',
    loadChildren: () => import('./indicadores/indicadores.module').then(m => m.IndicadoresModule)
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
