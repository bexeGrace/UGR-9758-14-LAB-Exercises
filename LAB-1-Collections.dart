int findHighest(List<int> numbers) {
  int highest = numbers[0];
  for (var number in numbers) {
    if (number > highest) {
      highest = number;
    }
  }
  return highest;
}
