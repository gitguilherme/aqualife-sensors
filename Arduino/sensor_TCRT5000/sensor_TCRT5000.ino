int pinoSensor = 7;

void setup(){
    pinMode(pinoSensor, INPUT);
    Serial.begin(9600);
}

void loop(){
  if(digitalRead(pinoSensor) == LOW){
    Serial.println("Objeto: detectado");    
  }else{
    Serial.println("Objeto: ausente");  
  }
  delay(3000);
}
