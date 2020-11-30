import sequelize from 'sequelize'
import db from '../models';
import { request, response } from 'express'


export async function getPersonas(req = request, res = response) {
    try {
        const personas = await await db.sequelize.query("SELECT * FROM getpersonas")
        res.status(200).json({ status: true, data: personas[0] })
    } catch (error) {
        res.status(500).json({ status: false, message: 'Error '+ error })
    }
}

export async function createPersona(req = request, res = response) {
    try {
        const { nom_persona, ape_pate_persona, ape_mate_persona, nid_grado, fecha_naci } = req.body;
        const foto_ruta = req.fileName;
        await db.sequelize.query("CALL spperson(:nom, :apeP, :apeM, :grd, :fecN, :ftr)", {
            replacements: {
            nom: nom_persona,
            apeP: ape_pate_persona,
            apeM: ape_mate_persona,
            grd: nid_grado,
            fecN: fecha_naci,
            ftr: foto_ruta }
        })
        return res.status(201).json({ status: true, message: 'created student successfully' })
    } catch (error) {
        res.status(500).json({ status: false, message: 'Error '+ error })
    }
}