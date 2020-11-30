module.exports = {
    PORT: process.env.PORT_DEVELOPMENT,
    DB: {
        connectionLimit: 10,
        host: process.env.DB_HOST_DEVELOPMENT || 'localhost',
        user: process.env.DB_USERNAME_DEVELOPMENT || 'postgres',
        password: process.env.DB_PASSWORD_DEVELOPMENT || '123456',
        database: process.env.DB_DATABASE_DEVELOPMENT || 'db_smiledu',
        dialect: process.env.DB_DIALECT_DEVELOPMENT || 'postgres',
    }
};