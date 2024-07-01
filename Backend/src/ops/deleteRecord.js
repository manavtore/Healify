import { record } from "../prisma/Client";

const deleteRecord = async (recordId) => {
  try {
    const deletedRecord = await record.delete({
      where: {
        id: recordId,
      },
    });
    return deletedRecord;
  } catch (error) {
    throw new Error(`Failed to delete record: ${error}`);
  }
};

export default deleteRecord;
