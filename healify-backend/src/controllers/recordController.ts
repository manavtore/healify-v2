import { Request, Response } from "express";
import prisma from "../config/database";

export const createRecord = async (req: Request, res: Response) => {
  try {
    const record = await prisma.record.create({
      data: {
        title: req.body.title,
        date: req.body.date,
        symptoms: req.body.symptoms,
        diagnosis: req.body.diagnosis,
        treatment: req.body.treatment,
        userId: req.body.userId,
      },
    });
    res.status(201).json(record);
  } catch (error) {
    res.status(400).json({ error: "Failed to create record" });
  }
};
