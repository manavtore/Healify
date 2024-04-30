import prisma from "../prisma/Client";
import { Record } from "../models/Record";

const saveRecord = async (recordData: Record) => {
  try {
    const createdRecord = await prisma.record.create({
      data: {
        title: recordData.title,
        date: recordData.date,
        symptoms: recordData.symptoms,
        diagnosis: recordData.diagnosis,
        treatment: recordData.treatment,
        user: {
          connect: { id: recordData.userid },
        },
        reports: {
          create: recordData.reports.map((report) => ({
            bucketName: report.bucketName,
            objectKey: report.objectKey,
            content: report.content,
            username: report.username,
          })),
        },
      },
    });
    return createdRecord;
  } catch (error) {
    throw new Error(`Failed to save record: ${error}`);
  }
};

export default saveRecord;
