var express = require("express");
var router = express.Router();

var tanqueController = require("../controllers/tanqueController");

router.get("/listarTanque/:idEmpresa", function(req, res) {
    tanqueController.listar(req, res);
});

module.exports = router
