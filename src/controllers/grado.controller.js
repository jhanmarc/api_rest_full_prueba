
// import sequelize from 'sequelize'
import db from '../models';
import { request, response } from 'express'

export async function getGrados(req = request, res = response) {
    try {
        const grados = await db.Grado.findAll()
        res.status(200).json({status: true, data: grados})
    } catch (error) {
        res.status(500).json({ status: false, message: 'Error '+ error })
    }
}