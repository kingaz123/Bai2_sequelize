import express from 'express';
import { createLike, createOrder, createRate, getListLikeByUser, getListRateByUser } from '../controllers/user.controller.js';





const userRouter = express.Router();

userRouter.post("/create-like", createLike);
userRouter.post("create-rate", createRate);
userRouter.get('/get-list-like-by-user/:user_id', getListLikeByUser);
userRouter.get('/get-list-rate-by-user/:user_id', getListRateByUser);
userRouter.post('/create-order', createOrder)


export default userRouter;