import { inject } from '@angular/core';
import { Router, Routes } from '@angular/router';
import { AuthService } from './services/auth/auth.service';

export const defaultRoute = '';
export const loginRoute = 'login';
export const homeRoute = 'home';

export const routes: Routes = [
  {
    path: defaultRoute,
    loadComponent: () =>
      import('./pages/splash/splash.component').then((m) => m.SplashComponent),
  },
  {
    path: loginRoute,
    loadComponent: () =>
      import('./pages/login/login.component').then((m) => m.LoginComponent),
  },
  {
    path: homeRoute,
    loadComponent: () =>
      import('./pages/home/home.component').then((m) => m.HomeComponent),
    // canMatch: [
    //   () =>
    //     inject(AuthService).userAuthenticatedGuard() ||
    //     inject(Router).createUrlTree([loginRoute]),
    // ],
  },
];
