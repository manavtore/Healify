import prisma from "../prisma/Client";

async function getRecord(id) {
  const record = await prisma.record.findUnique({
    where: { id: id },
  });
  return record;
}

export default getRecord;
