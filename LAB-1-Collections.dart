// Excercise 1

int findHighest(List<int> numbers) {
  int highest = numbers[0];
  for (var number in numbers) {
    if (number > highest) {
      highest = number;
    }
  }
  return highest;
}

// Excercise 2

void printMap(Map<dynamic, dynamic> map) {
  map.forEach((key, value) {
    print('$key: $value');
  });
}

// Excercise 3

List<T> removeDuplicates<T>(List<T> list) {
  Set<T> uniqueSet = Set<T>.from(list);

  return uniqueSet.toList();
}
