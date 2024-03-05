import 'dart:io';

void main() {
  // Excercise 1

  print('Enter a number from 1 to 7: ');
  int? dayOfWeek = int.parse(stdin.readLineSync()!);
  switch (dayOfWeek) {
    case 1:
      print('Sunday');
      break;
    case 2:
      print('Monday');
      break;
    case 3:
      print('Tuesday');
      break;
    case 4:
      print('Wednesday');
      break;
    case 5:
      print('Thursday');
      break;
    case 6:
      print('Friday');
      break;
    case 7:
      print('Saturday');
      break;
    default:
      print('Invalid day of the week');
  }

  // Excercise 2

  int n = 10;
  int first = 0, second = 1;

  for (int i = 0; i < n; i++) {
    print(first);
    int next = first + second;
    first = second;
    second = next;
  }
}
