
import { Router } from 'express'
const router = Router()

import cc from '../controllers'
import { uploadImage } from '../lib/uploaders'

router.get('/', cc.PersonaController.getPersonas)
router.post('/', uploadImage ,cc.PersonaController.createPersona)

export default router

