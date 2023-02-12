import express from 'express'
import cors from 'cors'
import axios from 'axios'

const PORT = process.env.PORT || 4000
const HOSTNAME = process.env.HOSTNAME || 'http://localhost'

const app = express()

app.use(express.json())
app.use(express.urlencoded({ extended: true }))

app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  res.header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
  next();
})

app.get('/', (req, res) => {

    axios({
        method: "get",
        url: "https://transporteservico.urbs.curitiba.pr.gov.br/getPontosLinha.php?linha=870&c=98ad8",
      })
      .then(function (response) {
        res.send( response.data)
      });

})

app.use(cors({ origin: '*'}))

app.use((req, res) => res.status(404));

app.listen(PORT, () => console.log(`Servidor rodando com sucesso ${HOSTNAME}:${PORT}`));
