RaceTrack track; //<>//
boolean raceOver;
ArrayList<Car> cars = new ArrayList<Car>();
int numOfCars=7;
int distanceBetweenCars = 80;
void setup() {
  size(1000, 600);
  track = new RaceTrack();
  for(int i = 0 ; i < numOfCars;i++){
      Car car = new Car(track.getStartPosition(), 100+i*distanceBetweenCars, 60, color(200, 100, 100));
      cars.add(car);
  }
  raceOver = false;
}

void draw() {
  background(70);
  for(Car car:cars){
  track.display();
  car.display();
  if (!raceOver) {
    if (car.getPosition() >= track.getFinishPosition()) {
      raceOver = true;
      detectOneWinner();
      println("Press 's' to restart");
    } else {
      car.move();
    }
  }
}
}

void keyPressed() {
  if (key == 's' && raceOver) {
    float startLine = track.getStartPosition();
    for(Car car:cars){
    car.setPosition(startLine);
    }
    raceOver = false;
  }
}
void detectOneWinner(){
  float distance = 0;
  int winner = 0;
  for(int i = 0 ; i < numOfCars;i++){
    if(cars.get(i).getPosition() > distance){
      distance = cars.get(i).getPosition();
      winner = i;}
  }
  cars.get(winner).increaseScore();
}
