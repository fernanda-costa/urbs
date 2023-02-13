import axios, { AxiosResponse } from "axios";
import express from "express";
import { Linha } from "../models/Linha";
import { Ponto } from "../models/Ponto";
import { Shape } from "../models/Shape";
import { Veiculo } from "../models/Veiculo";
import { LinhasService } from '../services/LinhasService';


export default class LinhasController {


    static buscarLinhas = async (req: express.Request, res: express.Response) => {
        // const result = LinhasService.buscarLinhas();
        // let linhas: [Linha] = result.data;
        return res.status(200).json({
        });
    };

    static buscarPontos = async (req: express.Request, res: express.Response) => {
        // let pontos: [Ponto] = result.data;
        return res.status(200).json({
        });
    };


    static buscarShapes = async (req: express.Request, res: express.Response) => {
        const linhaId: number = Number(req.params.linhaId);
        const result = await new LinhasService().buscarShape(linhaId);
        let shapes: Shape[] = result.data;
        shapes = shapes.map((pontoShape: any) => {
            return new Shape(pontoShape.SENTIDO, parseFloat(pontoShape.LAT?.replace(',', '.')), parseFloat(pontoShape.LON?.replace(',', '.')));
        });

        return res.status(200).json(shapes);
    };
}

