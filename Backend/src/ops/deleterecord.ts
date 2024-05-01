import prisma from "../prisma/Client";

const deleteRecordById = async (recordId: string) => {
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

    await prisma.record.delete({
      where: {
        id: recordId,
      },
    });

    console.log(`Record with ID ${recordId} deleted successfully`);
  } catch (error) {
    console.error("Error deleting record:", error);
    throw new Error(`Failed to delete record: ${error}`);
  }
};

export default deleteRecordById;
