import express from "express";
import { getListLikeByRes, getListRateByRes } from "../controllers/res.controllers.js";


const resRouter = express.Router();

resRouter.get("/get-list-like-by-res/:res_id", getListLikeByRes)
resRouter.get("/get-list-rate-by-res/:res_id", getListRateByRes)

export default resRouter;