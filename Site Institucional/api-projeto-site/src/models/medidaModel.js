var database = require("../database/config");

function buscarUltimasMedidas(idSensor, limite_linhas) {
    instrucaoSql = `SELECT logSensor, DATE_FORMAT(dataHoraLog, "%H:%I:%S") as dataHoraLog FROM logSensor where fkSensor = ${idSensor}
                        order by idLogSensor desc limit ${limite_linhas}`;
    console.log("Executando a instrução SQL: \n"+instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idSensor) {
    instrucaoSql = `SELECT logSensor, DATE_FORMAT(dataHoraLog, "%H:%I:%S") as dataHoraLog FROM logSensor where fkSensor = ${idSensor}
                    order by idLogSensor desc limit 1`;
                    
    console.log("Executando a instrução SQL: \n"+instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}