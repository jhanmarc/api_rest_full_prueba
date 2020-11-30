import '@babel/polyfill'
import dotenv from 'dotenv'
dotenv.config()
import app from './app'
// import './utils/connection'

const port = process.env.PORT || 3000
const urlBase = process.env.URL_BASE || "http://localhost"

function main() {
    app.listen(port, ()=> {
        console.log(`Server run, url ${urlBase}:${port}`)
    })
}

main()