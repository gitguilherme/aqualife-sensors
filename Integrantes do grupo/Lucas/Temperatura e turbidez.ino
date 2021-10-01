int sensorLM35 = A0;
int sensorLDR = A1;

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
  valorLDR = analogRead(sensorLDR);

  temperatura = valorLM35*0.0048;
  temperatura*=100;

  voltagem = valorLDR*5/1024;
  turbidez = -111.25*voltagem+506.67;

//  Serial.print("Temperatura: ");
  Serial.println(temperatura);
 // Serial.print("Luminosidade:");
  Serial.println(valorLDR);
//  Serial.print("Turbidez: ");
 // Serial.println(turbidez);
  delay(1000);
}
