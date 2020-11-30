import path from 'path'
import multer from 'multer'
import { v4 as uuidv4 } from 'uuid'
import dotenv from 'dotenv'
dotenv.config()

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        const ruta = process.env.RUTE_STORAGE_PICTURES || '../../public/storage/images' 
        cb(null, path.join(__dirname, `${ruta}`))
    },
    filename: async(req, file, cb) => {
        const filename = `${uuidv4()}${path.extname(file.originalname).toLocaleLowerCase()}`
        cb(null, filename)
        req.fileName = filename
    }
})

export const uploadImage = multer({
    storage,
    limits: { fileSize: 5 * 1024 * 1024 }, //5 Megas tamaño de la imagen
    fileFilter: (req, file, cb) => {
        const fileTypes = /jpeg|jpg|png/
        const mimetype = fileTypes.test(file.mimetype)
        const extname = fileTypes.test(path.extname(file.originalname))
        if (mimetype && extname) return cb(null, true)
        cb("error: archivo debe ser jpeg, jpg o png")
    }
}).single('foto_ruta')
