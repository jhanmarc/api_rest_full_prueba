module.exports = (sequelize, DataTypes) => {
    const Cronograma = sequelize.define('Cronograma', {
        id_cronograma: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
        },
        year: DataTypes.INTEGER,
    }, {
        timestamps: false,
        tableName: 'cronograma'
    });
    
    return Cronograma;
};