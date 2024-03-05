// This function serves as an answer for both questions!
Future<int> fetchNumber() {
  return Future.delayed(Duration(seconds: 2), () {
    return 42;
  });
}

void main() async {
  print('Fetching number...');
  int result = await fetchNumber();
  print('The fetched number is: $result');
}
