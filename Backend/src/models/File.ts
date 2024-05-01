

export interface File {
  id: string;
  bucketName: string;
  objectKey: string;
  content: string;
  username: string;
  metadata?: { [key: string]: string };
}