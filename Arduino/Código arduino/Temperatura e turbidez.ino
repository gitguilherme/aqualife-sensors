int sensorLM35 = A0;
int sensorLDR = A2;

float valorLM35 = 0;
int valorLDR = 0;

float temperatura = 0;
float voltagem = 0;
float turbidez = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  valorLM35 = analogRead(sensorLM35);
  delay(100);
  
  valorLDR = analogRead(sensorLDR);

  temperatura = valorLM35*0.0048;
  temperatura*=100;

  voltagem = valorLDR*5/1023;
  turbidez = -111.25*voltagem+506.67;

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
  }

  if(turbidez >= 100){
    Serial.println("Turbidez crítica");
  }else if(turbidez >= 83.4){
    Serial.println("Temperatura próxima de crítica");
  }else if(turbidez >= 66,67){
    Serial.println("Alerta!");
  }*/

//  Serial.print("Temperatura: ");
  Serial.print(temperatura);
  Serial.print(" ");
 // Serial.println(valorLDR);
 // Serial.print("Luminosidade:");
  //Serial.println(valorLDR);
//  Serial.print("Turbidez: ");
 Serial.println(turbidez);
  delay(1000);
}
