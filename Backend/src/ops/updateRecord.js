import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function updateRecordById(recordId, recordData) {
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
      data: recordData,
    });

    console.log(`Record with ID ${recordId} updated successfully`);
    return updatedRecord;
  } catch (error) {
    console.error("Error updating record:", error);
    throw new Error(`Failed to update record: ${error}`);
  }
}

export default updateRecordById;
