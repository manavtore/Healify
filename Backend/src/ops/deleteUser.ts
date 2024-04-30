// import { PrismaClient } from "@prisma/client";
// import { Request,Response } from "aws-sdk";
// import { response } from "express";
// import { request} from "http";

// const prisma = new PrismaClient();

// interface UsernamePayload {
//   username: string;
// }

// export const getUserByName = async (): Promise<void> => {
//   try {
//     const { name }: { name: string } =  ;

//     const user = await prisma.user.findFirst({
//       where: {
//         name: name,
//       },
//       include: {
//         records: {
//           include: {
//             reports: true,
//           },
//           orderBy: {
//             id: "desc", 
//           },
//         },
//       },
//     });

//     if (!user) {

//       response.status(404).json({ error: "User not found" });
//       return;
//     }

//     response.status(200).json({ data: user });
//   } catch (error) {
  
//     response.status(500).json({ error: `Failed to get user:` });
//   } finally {
//     await prisma.$disconnect();
//   }
// };
