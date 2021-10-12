const express = require('express');
const { ArduinoDataTemp } = require('./newserial')
const router = express.Router();


router.get('/', (request, response, next) => {

    let sum = ArduinoDataTemp.List.reduce((a, b) => a + b, 0);
    let average = (sum / ArduinoDataTemp.List.length).toFixed(2);
    let sumTurbizez = ArduinoDataTemp.ListTurbidez.reduce((a, b) => a + b, 0);
    let averageTurbidez = (sumTurbizez/ArduinoDataTemp.ListTurbidez.length).toFixed(2);
    
    response.json({
        data: ArduinoDataTemp.List,
        turbidez: ArduinoDataTemp.ListTurbidez,
        total: ArduinoDataTemp.List.length,
        average: isNaN(average) ? 0 : average,
        averageTurbidez: isNaN(averageTurbidez) ? 0 : averageTurbidez
    });

});

module.exports = router;