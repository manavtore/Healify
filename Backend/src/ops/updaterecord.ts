import { PrismaClient } from '@prisma/client';
import { Record } from '../models/Record';
import exp from 'constants';

const prisma = new PrismaClient();

export async function updateRecordById(recordId: string, recordData: Record) {
  try {
    const existingRecord = await prisma.record.findUnique({
      where: {
        id: recordId,
      },
    });

    if (!existingRecord) {
      console.log("Record not found");
      return;
    }

    const updatedRecord = await prisma.record.update({
      where: {
        id: recordId,
      },
      
       data: recordData as any,
    });

    console.log(`Record with ID ${recordId} updated successfully`);
    return updatedRecord;
  } catch (error) {
    console.error("Error updating record:", error);
    throw new Error(`Failed to update record: ${error}`);
  }
}

export default updateRecordById;
