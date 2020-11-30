
import { Router } from 'express'

const apiRouter = Router()

// importing routes
import GradoRouter from './grado.routes'
import PersonaRouter from './persona.routes'

//use routes
apiRouter.use('/grado', GradoRouter)
apiRouter.use('/persona', PersonaRouter)

// return router
export default apiRouter