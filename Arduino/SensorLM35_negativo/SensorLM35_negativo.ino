int pinoSensor = 5; // Saida do sensor na A0. 
int valorLido = 0; //Variável auxiliar.
float temperatura = 0; //Variável que armazenará a temperatura lida 
int linha =0; //variavel que se refere as linhas do excel

void setup() {//Função que será executada uma
Serial.begin(9600); //Inicia a comunicação serial a 9600 bauds.
Serial.println("CLEARDATA"); //reset comunicação serial 
Serial.println("Temperatura, linha"); //nomeia a coluna 
}
void loop() {//Função que será executada continuamente.
valorLido = analogRead(pinoSensor);//Leitura analógica da porta A0
temperatura = (valorLido * 0.00488);// 5 volts/ 1023 = 0,0048 precisão do A/D 
temperatura = temperatura * 100;// converte milivolts para celsius - cada 10mV == 1 grau C
temperatura = temperatura - 27;
linha++;//incrementa linha para que a leitura pule linha 
Serial.print(temperatura);
Serial.print(",");
Serial.println(linha);

if(linha > 100)// loop para limitar a qte de dados
{
linha = 0;
Serial.println("ROW, SET,2");//alimentação das linhas sempre com os dados iniciados
}
delay(100); //Tempo 5 seg para realizar outra leitura.
}
