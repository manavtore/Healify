import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function getUserByUsername(username) {
  const user = await prisma.user.findUnique({
    where: { username: username },
  });
  return user;
}

export default getUserByUsername;
