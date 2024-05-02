import express from 'express';
import { PrismaClient } from '@prisma/client';
import {generateUploadPresignedUrl,generateDownloadPresignedUrl,} from './ops/awss3';
import  deleteRecordById  from "./ops/deleterecord";
import deleteUserByUsername from './ops/deleteUser';
import saveRecord from './ops/saveRecord';
import createUser from './ops/saveUser';
import getRecord from './ops/getRecord';
import getUserByUsername from './ops/getUser';
import prisma from './prisma/Client';
import updateRecordById from "./ops/updaterecord";
import updateUser from "./ops/updateUser";

const app = express();

const PORT = process.env.PORT || 3001;

app.use(express.json());

app.post('/generateUploadPresignedUrl', generateUploadPresignedUrl);
app.post('/generateDownloadPresignedUrl', generateDownloadPresignedUrl);
app.delete("/deleteRecord", deleteRecordById);
app.delete('/deleteUser', deleteUserByUsername);
app.post('/getRecord', getRecord);
app.post('/getUser', getUserByUsername);
app.post('/saveRecord', saveRecord);
app.post('/saveUser', createUser);
app.post('/updateRecord', async (req, res, next) => {
  try {
    const userId = req.body.userId;
    const userData = req.body.userData;
    const updatedRecord = await updateRecordById(userId, userData);
    res.json(updatedRecord);
  } catch (error) {
    next(error);
  }
});
app.post("/updateUser", async (req, res, next) => {
  try {
    const userId = req.body.userId;
    const userData = req.body.userData;
    const updatedRecord = await updateRecordById(userId, userData);
    res.json(updatedRecord);
  } catch (error) {
    next(error);
  }
});

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});

process.on('SIGINT', async () => {
    try {
        await prisma.$disconnect();
        console.log('Prisma client disconnected.');
        process.exit(0);
    } catch (e) {
        console.error('Error disconnecting Prisma client:', e);
        process.exit(1);
    }
}
    );
