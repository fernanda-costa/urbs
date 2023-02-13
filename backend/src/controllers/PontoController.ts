import axios, { AxiosResponse } from "axios";
import express from "express";
import { Linha } from "../models/Linha";
import { Ponto } from "../models/Ponto";
import { Shape } from "../models/Shape";

export class PontoController {

    static buscarPontosPorLocalizacao = async (req: express.Request, res: express.Response) => {
        let result: AxiosResponse = await axios.get('');
        let pontos: [Ponto] = result.data;
        return res.status(200).json({
        });
    };


    static buscarPontoPorFitros = async (req: express.Request, res: express.Response) => {
        let result: AxiosResponse = await axios.get('');
        let pontos: [Ponto] = result.data;
        return res.status(200).json({
        });
    };
}