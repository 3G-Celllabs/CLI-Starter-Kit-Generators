import { Injectable } from "@angular/core";
import { Location } from "@angular/common";
import {
  ActivatedRouteSnapshot,
  CanActivate,
  RouterStateSnapshot,
  UrlTree,
} from "@angular/router";
import { Observable } from "rxjs";

@Injectable({
  providedIn: "root",
})
export class UserAuthorizedGuard implements CanActivate {
  constructor(private location: Location) {}

  canActivate(
    route: ActivatedRouteSnapshot,
    _: RouterStateSnapshot
  ):
    | Observable<boolean | UrlTree>
    | Promise<boolean | UrlTree>
    | boolean
    | UrlTree {
    if (this.ifNotAuthorized(route)) {
      this.location.back();
      return false;
    }
    return true;
  }

  private ifNotAuthorized(route: ActivatedRouteSnapshot): boolean {
    return true;
  }
}
