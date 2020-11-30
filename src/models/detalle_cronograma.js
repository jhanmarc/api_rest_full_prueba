module.exports = (sequelize, DataTypes) => {
    const Detalle_cronograma = sequelize.define('Detalle_cronograma', {
        id_detalle_cronograma: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
        },
        id_cronograma: DataTypes.INTEGER,
        desc_pension: DataTypes.STRING(50),
        monto: DataTypes.DECIMAL,
        fecha_naci: DataTypes.DATE,
    }, {
        timestamps: false,
        tableName: 'detalle_cronograma'
    });
    Detalle_cronograma.associate = function(models) {
        Detalle_cronograma.hasMany(models.Cronograma, { foreingKey: 'id_cronograma', sourceKey: 'id_cronograma' })
    };
    return Detalle_cronograma;
};
