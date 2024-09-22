import express from "express";
import {
  createFile,
  generateUploadPresignedUrl,
  generateDownloadPresignedUrl,
} from "../controllers/fileController";

const router = express.Router();

router.post("/create-file", createFile);
router.post("/upload-url", generateUploadPresignedUrl);
router.post("/download-url", generateDownloadPresignedUrl);

export default router;
