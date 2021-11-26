var database = require("../database/config")

function listarTemperaturaMaxima() {
    console.log("ACESSEI A EMPRESA MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
        SELECT 
            max(LogSensor) as 'Maiortemperaturadodia' 
                FROM logSensor 
                    where fkSensor = 1010112 
                        and DataHoraLog >= curdate();`;
                        
    console.log("Executando a instrução SQL: \n"+instrucao);
    return database.executar(instrucao);

}

module.exports = {
    listarTemperaturaMaxima,
};