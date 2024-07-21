import express from "express";
import resRoutes from "./res.routes.js";
import userRoutes from "./user.routes.js";

const rootRoutes = express.Router();

rootRoutes.use('/res', resRoutes);
rootRoutes.use("/user", userRoutes);

export default rootRoutes;