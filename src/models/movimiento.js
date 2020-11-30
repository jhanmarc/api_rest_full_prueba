module.exports = (sequelize, DataTypes) => {
    const Movimiento = sequelize.define('Movimiento', {
        id_movimiento: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
        },
        tipo_movimiento: DataTypes.STRING(20),
        monto: DataTypes.DECIMAL,
        estado: DataTypes.STRING(20),
        fecha_pago: DataTypes.DATE,
        nid_persona: DataTypes.INTEGER,
        id_detalle_cronograma: DataTypes.INTEGER,
    }, {
        timestamps: false,
        tableName: 'movimiento'
    });
    Movimiento.associate = function(models) {
        Movimiento.hasMany(models.Persona, { foreingKey: 'nid_persona', sourceKey: 'nid_persona' })
        Movimiento.hasMany(models.Detalle_cronograma, { foreingKey: 'id_detalle_cronograma', sourceKey: 'id_detalle_cronograma' })
    };
    return Movimiento;
};