import { Sequelize } from "sequelize";


const sequelize = new Sequelize("node43_food", "root", "1234", {
    host: "localhost",
    port: 3308,
    dialect: "mysql1",
})

export default sequelize;