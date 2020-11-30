import { Router } from 'express'
const router = Router()
import cc from '../controllers'

router.get('/', cc.GradoController.getGrados)

export default router