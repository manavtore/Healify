import { S3 } from "aws-sdk";
import { File } from "../models/File";

async function generateUploadPresignedUrl(file) {
  const s3 = new S3();
  const expiration = 10 * 60;

  const params = {
    Bucket: file.bucketName,
    Key: `${file.username}/${file.content}/${file.objectKey}`,
    Expires: expiration,
  };

  try {
    const url = await s3.getSignedUrlPromise("putObject", params);
    return url;
  } catch (error) {
    console.error("Error generating upload presigned URL:", error);
    throw error;
  }
}

async function generateDownloadPresignedUrl(file) {
  const s3 = new S3();
  const expiration = 6 * 24 * 60 * 60;

  const params = {
    Bucket: file.bucketName,
    Key: `${file.username}/${file.content}/${file.objectKey}`,
    Expires: expiration,
  };

  try {
    const url = await s3.getSignedUrlPromise("getObject", params);
    return url;
  } catch (error) {
    console.error("Error generating download presigned URL:", error);
    throw error;
  }
}

export default {
  generateUploadPresignedUrl,
  generateDownloadPresignedUrl,
};
