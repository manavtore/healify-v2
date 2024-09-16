import { Request, Response } from "express";
import prisma from "../config/database";
import { generateUploadUrl, generateDownloadUrl } from "../services/s3Service";

export const createFile = async (req: Request, res: Response) => {
  try {
    const file = await prisma.file.create({
      data: {
        bucketName: req.body.bucketName,
        objectKey: req.body.objectKey,
        content: req.body.content,
        username: req.body.username,
        recordId: req.body.recordId,
      },
    });
    res.status(201).json(file);
  } catch (error) {
    res.status(400).json({ error: "Failed to create file" });
  }
};

export const generateUploadPresignedUrl = async (
  req: Request,
  res: Response
) => {
  try {
    const { bucketName, objectKey, username, content } = req.body;
    const url = await generateUploadUrl(
      bucketName,
      `${username}/${content}/${objectKey}`
    );
    res.json({ url });
  } catch (error) {
    res.status(400).json({ error: "Failed to generate upload URL" });
  }
};

export const generateDownloadPresignedUrl = async (
  req: Request,
  res: Response
) => {
  try {
    const { bucketName, objectKey, username, content } = req.body;
    const url = await generateDownloadUrl(
      bucketName,
      `${username}/${content}/${objectKey}`
    );
    res.json({ url });
  } catch (error) {
    res.status(400).json({ error: "Failed to generate download URL" });
  }
};
