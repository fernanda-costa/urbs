import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PontosListaComponent } from './pontos-lista.component';

describe('PontosListaComponent', () => {
  let component: PontosListaComponent;
  let fixture: ComponentFixture<PontosListaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PontosListaComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PontosListaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
