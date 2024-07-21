import express from 'express';
import rootRouter from './src/routes/rootRouter.js';
import cors from 'cors';

const app = express();
const port = 8080;


app.use(express.json());
app.use(cors());
app.use(rootRouter);



app.listen(port, () => {
  console.log("Back end starts running...")
})