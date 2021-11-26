var database = require("../database/config")

function listar(idEmpresa) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
        SELECT Tamanhom3, QntdSensores, QntdPeixes, Especie, DATE_FORMAT(DataEntrada, "%d/%m/%Y") as DataEntrada FROM tanque where fkEmpresa = ${idEmpresa};
    `;
    console.log("Executando a instrução SQL: \n"+instrucao);
    return database.executar(instrucao);
}

module.exports = {
    listar,
}