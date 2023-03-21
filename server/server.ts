import express, { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const app = express();
const prisma = new PrismaClient();

// get all users
app.get("/", async (reg: Request, res: Response) => {
  const users = await prisma.user.findMany();
  res.json({ users });
});

// create user
app.post("/", (reg: Request, res: Response) => {});

// delete a single user
app.delete("/:user_id", (reg: Request, res: Response) => {});

app.listen(3001);
