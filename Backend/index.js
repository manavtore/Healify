import express, { json } from "express";

import deleteRecordById from "./src/ops/deleteRecord";
import saveRecord from "./src/ops/createRecord";
import createUser from "./src/ops/createUser";
import getRecord from "./src/ops/getRecord";
import getUserByUsername from "./src/ops/getUser";
import { $disconnect } from "./src/prisma/Client";
import updateUser from "./src/ops/updateUser";
import updateRecordById from "./src/ops/updateRecord";

import { generateUploadPresignedUrl, generateDownloadPresignedUrl } from "./ops/s3Operations";
const app = express();
const PORT = process.env.PORT || 3001;

app.use(json());

app.post("/generateUploadPresignedUrl", async (req, res, next) => {
  try {
    const url = await generateUploadPresignedUrl(req.body);
    res.json({ url });
  } catch (error) {
    next(error);
  }
});

app.post("/generateDownloadPresignedUrl", async (req, res, next) => {
  try {
    const url = await generateDownloadPresignedUrl(req.body);
    res.json({ url });
  } catch (error) {
    next(error);
  }
});

app.delete("/deleteRecord", deleteRecordById);
app.delete("/deleteUser", deleteUserByUsername);
app.post("/getRecord", async (req, res, next) => {
  try {
    const record = await getRecord(req.body.id);
    res.json(record);
  } catch (error) {
    next(error);
  }
});
app.post("/getUser", async (req, res, next) => {
  try {
    const user = await getUserByUsername(req.body.username);
    res.json(user);
  } catch (error) {
    next(error);
  }
});
app.post("/saveRecord", saveRecord);
app.post("/saveUser", createUser)

app.post("/updateRecord", async (req, res, next) => {
  try {
    const recordId = req.body.recordId;
    const recordData = req.body.recordData;
    const updatedRecord = await updateRecordById(recordId, recordData);
    res.json(updatedRecord);
  } catch (error) {
    next(error);
  }
});

app.post("/updateUser", async (req, res, next) => {
  try {
    const userId = req.body.userId;
    const userData = req.body.userData;
    const updatedUser = await updateUser(userId, userData);
    res.json(updatedUser);
  } catch (error) {
    next(error);
  }
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

process.on("SIGINT", async () => {
  try {
    await $disconnect();
    console.log("Prisma client disconnected.");
    process.exit(0);
  } catch (e) {
    console.error("Error disconnecting Prisma client:", e);
    process.exit(1);
  }
});
