import express from "express"
import cors from 'cors'
import morgan from 'morgan'
import path from 'path'

const app = express()

// importing routes
import Routers from './routes'

//settings
app.use(cors({ origin: true, credentials: true }));
app.use(morgan('dev'))
app.use(express.urlencoded({ extended: true }))
app.use(express.json())

//static files
let ruta = process.env.ROUTE_PUBLIC || '../public/';
app.use(express.static(path.join(__dirname, `${ruta}`)))

app.use('/api', Routers)

export default app