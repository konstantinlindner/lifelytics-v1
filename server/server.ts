import express, { Request, Response } from "express";

const app = express();

app.get("/", (reg: Request, res: Response) => {
  res.json({ message: "hello2test" });
});

app.listen(3001);
