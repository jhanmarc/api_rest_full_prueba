module.exports = (sequelize, DataTypes) => {
    const Persona = sequelize.define('Persona', {
        nid_persona: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
        },
        nom_persona: DataTypes.STRING(50),
        ape_pate_persona: DataTypes.STRING(50),
        ape_mate_persona: DataTypes.STRING(50),
        nid_grado: DataTypes.INTEGER,
        fecha_naci: DataTypes.DATE,
        foto_ruta: DataTypes.TEXT,
    }, {
        timestamps: false,
        tableName: 'personas'
    });
    Persona.associate = function(models) {
        Persona.hasOne(models.Grado, { foreingKey: 'nid_grado', sourceKey: 'nid_grado' })
    };
    return Persona;
};