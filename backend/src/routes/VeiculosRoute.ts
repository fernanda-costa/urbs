import express from "express";
import { VeiculoController } from "../controllers/VeiculoController";

const router = express.Router();

router
  .get("/veiculos/linha/:id", VeiculoController.buscarLocalizacaoAtual)


  export default router;   