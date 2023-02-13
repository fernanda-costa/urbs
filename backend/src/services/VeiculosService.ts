import axios from "axios";

export class VeiculosService {

   async buscarLocalizacaoAtual(linhaId: number) {
        return axios({ method: "get", url: "https://transporteservico.urbs.curitiba.pr.gov.br/getVeiculos.php?linha=466&c=d2fde" })
    }
}