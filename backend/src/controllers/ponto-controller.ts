import axios, { AxiosResponse } from "axios";
import express from "express";
import { Ponto } from "../models/ponto";


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