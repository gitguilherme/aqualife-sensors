int pinoSensor = A1; // Saida do sensor na A0. 
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
linha++;//incrementa linha para que a leitura pule linha 

//Serial.print("Temperatura: ");
Serial.println(temperatura);
//Serial.print(" ");
//Serial.print(",");
//Serial.println(linha);
/*
if(temperatura >= 31){
  Serial.println("Temperatura crítica: acima do desejado, pode ocorrer perda");
}
else if(temperatura >= 26){
  Serial.println("Temperatura OK: Tamanho grande");
}
else if(temperatura >= 23){
  Serial.println("Temperatura OK: Tamanho médio");  
}
else if(temperatura >= 19){
  Serial.println("Temperatura com taxa de crescimento reduzida");
}
else if(temperatura >= 18 && temperatura <= 18.99){
  Serial.println("Abaixo dessa temperatura a reprodução é interrompida");
}
else if (temperatura >= 17 && temperatura <= 17.99){
  Serial.println("Temperatura com taxa de crescimento reduzida e reprodução interrompida");
}
else if(temperatura >= 16 && temperatura <= 16.99){
  Serial.println("Abaixo dessa temperatura a alimentação é interrompida");
}
else if(temperatura >= 11){
  Serial.println("Temperatura com taxa de crescimento prejudicada, reprodução e alimentação interrompida");
}
else{
  Serial.println("Risco de morte");
}*/
  
if(linha > 100)// loop para limitar a qte de dados
{
linha = 0;
//Serial.println("ROW, SET,2");//alimentação das linhas sempre com os dados iniciados
}
delay(500); //Tempo 5 seg para realizar outra leitura.
}
