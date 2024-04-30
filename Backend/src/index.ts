import express from 'express'
import multer from 'multer'
const app = express()

app.use(express.json())

const storage = multer.memoryStorage()

app.listen(3000, () => {
    console.log("Nigga")
})

