import express from "express";
import LinhasController from "../controllers/LinhaController";

const router = express.Router();

router
  .get("/linhas/shape/:id", LinhasController.buscarShapes)


  export default router;   