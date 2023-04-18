import { ComponentFixture, TestBed } from '@angular/core/testing';
import { SplashPage } from './splash.page';

describe('SplashPage', () => {
  let component: SplashPage;
  let fixture: ComponentFixture<SplashPage>;

  beforeEach(async () => {
    fixture = TestBed.createComponent(SplashPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
