import { Routes } from "@angular/router";

export const defaultRoute = "";
export const loginRoute = "login";
export const homeRoute = "home";

export const routes: Routes = [
  {
    path: defaultRoute,
    loadChildren: () =>
      import("./pages/splash/splash.module").then((m) => m.SplashPageModule),
  },
  {
    path: loginRoute,
    loadChildren: () =>
      import("./pages/login/login.module").then((m) => m.LoginPageModule),
  },
  {
    path: homeRoute,
    loadChildren: () =>
      import("./pages/home/home.module").then((m) => m.HomePageModule),
  },
];
