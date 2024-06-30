const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

async function updateUser(id, data) {
  try {
    const updatedUser = await prisma.user.update({
      where: { id: id },
      data: data,
    });
    return updatedUser;
  } catch (error) {
    console.error("Error updating user:", error);
    throw error; 
  } finally {
    await prisma.$disconnect();
  }
}

export default updateUser;
