
import { Record } from "./Record";

export interface User {
  name: string;
  username: string;
  height: string;
  weight: string;
  age: string;
  bloodgroup: string;
  gender: string;
  records: Record[];
  address: string;
  image?: string;
  authId: string;
}
