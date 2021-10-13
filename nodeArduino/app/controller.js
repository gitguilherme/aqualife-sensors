const express = require('express');
const { ArduinoDataTemp } = require('./newserial')
const router = express.Router();


router.get('/', (request, response, next) => {

    let sumTemperatura = ArduinoDataTemp.listaTemperatura.reduce((a, b) => a + b, 0);
    let averageTemperatura = (sumTemperatura / ArduinoDataTemp.listaTemperatura.length).toFixed(2);
    let sumTurbidez = ArduinoDataTemp.listaTurbidez.reduce((a, b) => a + b, 0);
    let averageTurbidez = (sumTurbidez/ArduinoDataTemp.listaTurbidez.length).toFixed(2);
    
    response.json({
        temperatura: ArduinoDataTemp.listaTemperatura,
        turbidez: ArduinoDataTemp.listaTurbidez,
        total: ArduinoDataTemp.listaTemperatura.length,
        averageTemperatura: isNaN(averageTemperatura) ? 0 : averageTemperatura,
        averageTurbidez: isNaN(averageTurbidez) ? 0 : averageTurbidez
    });

});

module.exports = router;