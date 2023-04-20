import { inject } from "@angular/core";
import { Router, Routes } from "@angular/router";
import { AuthService } from "./services/auth/auth.service";

export const defaultRoute = "";
export const loginRoute = "login";
export const homeRoute = "home";

export const routes: Routes = [
  {
    path: defaultRoute,
    loadComponent: () =>
      import("./pages/splash/splash.page").then((m) => m.SplashPage),
  },
  {
    path: loginRoute,
    loadComponent: () =>
      import("./pages/login/login.page").then((m) => m.LoginPage),
  },
  {
    path: homeRoute,
    loadComponent: () =>
      import("./pages/home/home.page").then((m) => m.HomePage),
    // canMatch: [
    //   () =>
    //     inject(AuthService).userAuthenticatedGuard() ||
    //     inject(Router).createUrlTree([loginRoute]),
    // ],
  },
];
