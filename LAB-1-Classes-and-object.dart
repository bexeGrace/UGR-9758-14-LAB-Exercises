// Excercise 1

class Car {
  String brand;
  String model;
  int year;

  Car(this.brand, this.model, this.year);

  // Excercise 2

  void makeSound() {
    print('Vroom Vroom');
  }
}

void main() {
  Car myCar = Car('Toyota', 'Corolla', 2022);

  print('Brand: ${myCar.brand}');
  print('Model: ${myCar.model}');
  print('Year: ${myCar.year}');
}
