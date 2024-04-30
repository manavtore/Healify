import prisma from "../prisma/Client";

import { User } from "../models/User";

import { Record } from "../models/Record";
import { Repostspace } from "aws-sdk";
const createUser = async (userData: User) => {
  try {
    const user = await prisma.user.create({
      data: {
        name: userData.name,
        username: userData.username,
        height: userData.height,
        weight: userData.weight,
        age: userData.age,
        bloodgroup: userData.bloodgroup,
        gender: userData.gender,
        records: {
          create: userData.records.map(record => ({
            id: record.id,
            title: record.title,
            date: record.date,
            symptoms: record.symptoms,
            diagnosis: record.diagnosis,
            treatment: record.treatment,
            reports: {
              create: record.reports.map(reports => ({
                id: reports.id,
                bucketName: process.env.AWS_BUCKET_NAME!,
                objectKey: reports.objectKey,
                content: reports.content,
                username: userData.username,
                metadata: reports.metadata,
              })),
            },
            userid: record.userid,
          })),
        },
        address: userData.address,
        image: userData.image!,
        authId: userData.authId,
      },
    });
    return user;
  } catch (error) {
    throw new Error(`Failed to create user: ${error}`);
  }
};

export default createUser;
