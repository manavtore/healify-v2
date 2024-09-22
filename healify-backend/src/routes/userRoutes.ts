import express from "express";
import {
  createUser,
  getUser,
  updateUser,
  deleteUser,
} from "../controllers/userController";

const router = express.Router();

router.post("/createUser", createUser);
router.get("/getUser/:id", getUser);
router.put("/updateUser/:id", updateUser);
router.delete("/deleteUser/:id", deleteUser);

export default router;
