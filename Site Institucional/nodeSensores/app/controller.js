const express = require('express');
const { ArduinoDataTemp } = require('./newserial');
const db = require('./database')
const router = express.Router();


router.get('/', (request, response, next) => {

    ArduinoDataTemp.List.map((item) => {
        let sum = item.data.reduce((a, b) => a + b, 0);
        let average = (sum / item.data.length).toFixed(2);
        item.total = item.data.length;
        item.average = isNaN(average) ? 0 : average
    })

    //let sum = ArduinoDataTemp.List.reduce((a, b) => a + b, 0);
    //let average = (sum / ArduinoDataTemp.List.length).toFixed(2);


    /*response.json({
        data: ArduinoDataTemp.List,
        total: ArduinoDataTemp.List.length,
        average: isNaN(average) ? 0 : average,
    });*/

    response.json(ArduinoDataTemp.List);


});

router.get('/logSensor/:idSensor', (request, response, next) => {

    var idSensor = request.params.idSensor

    //let sum = ArduinoDataTemp.List.reduce((a, b) => a + b, 0);
    //let average = (sum / ArduinoDataTemp.List.length).toFixed(2);

    var sql = "SELECT logSensor, DATE_FORMAT(datahoraLog, '%H:%i:%S') as dataHoraLog from logSensor where fkSensor = ?";

    db.query(sql, [idSensor], function (err, result) {
        if (err) throw err;
        
        response.json(result);
        console.log(result)
    });

});

router.post('/sendData', (request, response) => {

    var temperatura_lm35 = ArduinoDataTemp.List[0].data;
    var turbidez = ArduinoDataTemp.List[1].data;

    temperatura_lm35 = temperatura_lm35[temperatura_lm35.length - 1];
    turbidez = turbidez[turbidez.length - 1];;

    var sql = "INSERT INTO logSensor (LogSensor, fkSensor) VALUES (?, ?);";

    db.query(sql, [temperatura_lm35, 1010112], function (err, result) {
        if (err) throw err;
        console.log("Number of records inserted: " + result.affectedRows);
    });
    console.log(sql)

    var sql = "INSERT INTO logSensor (LogSensor, fkSensor) VALUES (?, ?);";

    db.query(sql, [turbidez, 1010111], function (err, result) {
        if (err) throw err;
        console.log("Number of records inserted: " + result.affectedRows);
    });


    response.sendStatus(200);
})

module.exports = router;