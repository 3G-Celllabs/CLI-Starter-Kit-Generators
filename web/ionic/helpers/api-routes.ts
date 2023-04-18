import { BASE_URL } from "src/environments/environment";

export class Routes {
  static routes: { [key in keyof typeof InternalRoutes]: string } = {
    login: "login",
    register: "register",
    getUser: "getUser",
    logout: "logout",
  };

  constructor() {}

  static buildRoute(route: string) {
    return BASE_URL + route;
  }

  static buildRouteWithParams(route: string, params: string) {
    return BASE_URL + route + params;
  }
}

export enum InternalRoutes {
  login,
  register,
  getUser,
  logout,
}
