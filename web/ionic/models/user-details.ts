import { UserRole } from "./user-roles";

export type UserDetails = {
  username: string;
  email: string;
  authToken: string;
  role: UserRole;
  userFLNames?: string;
  phoneNumber?: string;
};
