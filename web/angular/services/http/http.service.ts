/* eslint-disable @typescript-eslint/naming-convention */
import { Injectable, Injector } from "@angular/core";
import { HttpClient } from "@angular/common/http";
import { APP_VERSION } from "src/environments/environment";
import { Routes } from "src/app/helpers/api-routes";
import { HelperService } from "src/app/services/helper/helper.service";
import { UserDetails } from "src/app/models/user-details";

@Injectable({
  providedIn: "root",
})
export class HttpService {
  headers: any;

  constructor(private http: HttpClient, private injector: Injector) {
    setTimeout(() => this.getPlatform());
  }

  getPlatform(): void {
    const platform = this.injector.get(HelperService).getDevicePlatform();

    this.headers = {
      "Access-Control-Allow-Headers": "*",
      "Access-Control-Allow-Origin": "*",
      platform: platform,
      appVersion: APP_VERSION,
    };
  }

  fetchData({ route, authToken, params }: FetchParams) {
    const options = {
      headers: { ...this.headers, "X-AUTH-TOKEN": authToken },
      withCredentials: true,
    };

    if (params === undefined) {
      return this.http.get(`${Routes.buildRoute(route)}`, options);
    }
    return this.http.get(
      `${Routes.buildRouteWithParams(route, params)}`,
      options
    );
  }

  postData({ route, body, userDetails }: PostParams) {
    const options = {
      headers: { ...this.headers },
      withCredentials: true,
    };

    if (userDetails === undefined) {
      return this.http.post(`${Routes.buildRoute(route)}`, body, options);
    }

    options.headers = {
      ...this.headers,
      "X-AUTH-TOKEN": userDetails.authToken,
    };
    return this.http.post(
      `${Routes.buildRouteWithParams(route, `?username=${userDetails.email}`)}`,
      body,
      options
    );
  }

  putData({ route, body, userDetails }: PostParams) {
    const options = {
      headers: { ...this.headers },
      withCredentials: true,
    };
    if (userDetails === undefined) {
      return this.http.put(`${Routes.buildRoute(route)}`, body, options);
    }

    options.headers = {
      ...options.headers,
      "X-AUTH-TOKEN": userDetails.authToken,
    };

    return this.http.put(
      `${Routes.buildRouteWithParams(route, `?username=${userDetails.email}`)}`,
      body,
      options
    );
  }

  deleteData({ body, route, userDetails, params }: DeleteParams) {
    const options = {
      headers: { ...this.headers, "X-AUTH-TOKEN": userDetails.authToken },
      withCredentials: true,
      body,
    };

    if (params === undefined) {
      return this.http.delete(`${Routes.buildRoute(route)}`, options);
    }

    return this.http.delete(
      `${Routes.buildRouteWithParams(route, params)}`,
      options
    );
  }

  logout(userDetails: UserDetails) {
    const options = {
      headers: { ...this.headers, "X-AUTH-TOKEN": userDetails.authToken },
      withCredentials: true,
    };

    return this.http.get(`${Routes.buildRoute(Routes.routes.logout)}`, options);
  }
}

export type FetchParams = {
  route: string;
  authToken: string;
  params?: string;
};

export type PostParams = {
  route: string;
  body: Record<string, unknown>;
  userDetails?: UserDetails;
};

export type DeleteParams = {
  route: string;
  params?: string;
  userDetails: UserDetails;
  body: Record<string, unknown>;
};
