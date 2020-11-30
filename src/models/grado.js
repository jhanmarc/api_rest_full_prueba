module.exports = (sequelize, DataTypes) => {
    const Grado = sequelize.define('Grado', {
        nid_grado: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
        },
        desc_grado: DataTypes.STRING(30),
        nivel: DataTypes.STRING(4)
    }, {
        timestamps: false,
        tableName: 'grados'
    });
    return Grado;
};