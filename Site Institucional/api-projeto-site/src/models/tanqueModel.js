var database = require("../database/config");

if(process.env.AMBIENTE_PROCESSO == "producao"){
    var dataFormato = "FORMAT(DataEntrada, 'dd-MM-yyyy')";
}
else{

    var dataFormato = 'DATE_FORMAT(DataEntrada, "%d/%m/%Y")';
}

function listar(idEmpresa) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
        SELECT Tamanhom3, QntdSensores, QntdPeixes, Especie, ${dataFormato} as DataEntrada FROM tanque where fkEmpresa = ${idEmpresa};
    `;
    console.log("Executando a instrução SQL: \n"+instrucao);
    return database.executar(instrucao);
}

module.exports = {
    listar,
}