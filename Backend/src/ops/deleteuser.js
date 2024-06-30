import { PrismaClient } from "@prisma/client";
import prisma  from "../prisma/Client";

const prisma = new PrismaClient();


async function deleteUserByUsername(username) {
  try {
    const user = await prisma.user.findUnique({
      where: {
        username: username,
      },
    });

    if (!user) {
      console.log("User not found");
      return;
    }

    await prisma.user.delete({
      where: {
        username: username,
      },
    });

    console.log(`User with username ${username} deleted successfully`);
  } catch (error) {
    console.error("Error deleting user:", error);
  } finally {
    await prisma.$disconnect();
  }
}

export default deleteUserByUsername;
