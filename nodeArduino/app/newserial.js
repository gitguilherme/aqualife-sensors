const sensors = require('./sensors')
const SerialPort = require("serialport");
const Readline = SerialPort.parsers.Readline;

class ArduinoRead {

    constructor() {
        this.listaTemperatura = [];
        this.listaTurbidez = [];
        
    }

    get ListaTemperatura() {
        return this.listaTemperatura;
    }

    get ListaTurbidez(){
        return this.listaTurbidez;
    }

    fake_data() {
        setInterval(() => {
            let data_float = sensors.lm35(20, 30);

            let luminosidade = sensors.ldr();

            let voltagem = luminosidade*5/1024;
            let turbidez = -111.25*voltagem+506.67;

            if (this.listaTemperatura.length === 59) {
                let sum = this.listaTemperatura.reduce((a, b) => a + b, 0);
                this.listDataHour.push((sum / this.listaTemperatura.length).toFixed(2));
                while (this.listaTemperatura.length > 0) {
                    this.listaTemperatura.pop();
                } 
            }


            console.log('Data', data_float);
        //    console.log('Luminosidade', luminosidade);

            this.listaTemperatura.push(data_float);
            this.listaTurbidez.push(turbidez);
        }, 2000);
    }


    SetConnection() {

        SerialPort.list().then(listSerialDevices => {

            let listArduinoSerial = listSerialDevices.filter(serialDevice => {
                return serialDevice.vendorId == 2341 && serialDevice.productId == 43;
            });

            if (listArduinoSerial.length != 1) {
                this.fake_data();
                console.log("Arduino not found - Generating data");
            } else {
                console.log("Arduino found in the com %s", listArduinoSerial[0].comName);
                return listArduinoSerial[0].comName;
            }
        }).then(comName => {
            try {
                let arduino = new SerialPort(comName, { baudRate: 9600 });

                const parser = new Readline();
                arduino.pipe(parser);
                arduino.on('close',() => {
                    console.log('Lost Connection');
                    this.fake_data();
                });
                parser.on('data', (data) => {
                    console.log('data', data);
                    
                    let split = data.split(" ");
                    
                    let temperatura = split[0];
                    let turbidez = split[1];
                    
                    this.listaTemperatura.push(parseFloat(temperatura));
                    this.listaTurbidez.push(parseFloat(turbidez));
                });
            } catch (e) {
                this.fake_data();
            }

        }).catch(error => console.log(error));
    }
}

const serial = new ArduinoRead();
serial.SetConnection();

module.exports.ArduinoDataTemp = { listaTemperatura: serial.ListaTemperatura, listaTurbidez: serial.ListaTurbidez}