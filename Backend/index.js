const express = require("express");

const deleteRecordById = require("./src/ops/deleteRecord");
const saveRecord = require("./src/ops/createRecord");
const createUser = require("./src/ops/createUser");
const getRecord = require("./src/ops/getRecord");
const getUserByUsername = require("./src/ops/getUser");
const prisma = require("./src/prisma/Client");
const updateUser = require("./src/ops/updateUser");
const updateRecordById =require("./src/ops/updateRecord");

const {
  generateUploadPresignedUrl,
  generateDownloadPresignedUrl,
} = require("./ops/s3Operations");
const app = express();
const PORT = process.env.PORT || 3001;

app.use(express.json());

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
    await prisma.$disconnect();
    console.log("Prisma client disconnected.");
    process.exit(0);
  } catch (e) {
    console.error("Error disconnecting Prisma client:", e);
    process.exit(1);
  }
});
