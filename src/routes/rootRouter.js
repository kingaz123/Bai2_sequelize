import express from "express";
import resRouter from "./res.router.js";
import userRouter from "./user.router.js";

const rootRouter = express.Router();

rootRouter.use('/res', resRouter);
rootRouter.use("/user", userRouter);

export default rootRouter;