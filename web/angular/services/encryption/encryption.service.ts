import { Injectable } from "@angular/core";
import * as cryptoJs from "crypto-js";
import { RK_IV_BASE64, RK_KEY_BASE64 } from "src/environments/environment";

@Injectable({
  providedIn: "root",
})
export class EncryptionService {
  private static rkKey = cryptoJs.enc.Base64.parse(RK_KEY_BASE64);
  private static rkIv = cryptoJs.enc.Base64.parse(RK_IV_BASE64);

  constructor() {}

  getEncryptedValue(value: string) {
    // Implement Encryption
  }

  getDecryptedValue(value: string) {
    //  implement Decryption
  }
}
