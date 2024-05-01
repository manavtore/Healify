import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export async function updateUser(
  id: string,
  data: {
    name?: string;
    username?: string;
    height?: string;
    weight?: string;
    age?: string;
    bloodgroup?: string;
    gender?: string;
    address?: string;
    image?: string;
    authId?: string;
  }
) {
  const updatedUser = await prisma.user.update({
    where: { id: id },
    data: data,
  });
  return updatedUser;
}

export default updateUser;