
import { File } from './File';
export interface Record {
  objectKey: any;
  content: any;
  name: any;
  metadata: any;
  id: string;
  title: string;
  date: string;
  symptoms: string[];
  diagnosis: string[];
  treatment: string[];
  reports: File[];
  userid: string;
}

export { File };
