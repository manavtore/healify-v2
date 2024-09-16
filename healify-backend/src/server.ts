import express from "express";
import userRoutes from "./routes/userRoutes";
import recordRoutes from "./routes/userRoutes";
import fileRoutes from "./routes/fileRoutes";

const app = express();

app.use(express.json());
app.use("/api/users", userRoutes);
app.use("/api/records", recordRoutes);
app.use("/api/files", fileRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
                                              
