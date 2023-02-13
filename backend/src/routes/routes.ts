import express from "express";
import linhasRoutes from "./LinhaRoute";
import veiculosRoutes from "./VeiculosRoute";

const Routes = (app: any) => {
  app.route('/').get((req: express.Request, res: express.Response) => {
    'URBS RODANDO'
  })

  app.use(
    express.json(),
    linhasRoutes,
    veiculosRoutes,
  )
}

export default Routes