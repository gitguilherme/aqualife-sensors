var express = require("express");
var router = express.Router();

var logSensorController = require("../controllers/logSensorController");

router.get("/listarTemperaturaMaxima", function(req, res) {
    logSensorController.listarTemperaturaMaxima(req, res);
});

router.get("/listarTemperaturaMinima", function(req,res) {
    logSensorController.listarTemperaturaMinima(req,res);
    
});

module.exports = router