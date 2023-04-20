import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { SplashComponent } from "./pages/splash/splash.component";
import { LoginComponent } from "./pages/login/login.component";
import { HomeComponent } from "./pages/home/home.component";
import { UserAuthorizedGuard } from "./guards/user-authorized/user-authorized.guard";

export const defaultRoute = "";
export const loginRoute = "login";
export const homeRoute = "home";

const routes: Routes = [
  { path: defaultRoute, component: SplashComponent },
  { path: loginRoute, component: LoginComponent },
  {
    path: homeRoute,
    component: HomeComponent,
    // canActivate: [UserAuthorizedGuard],
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
