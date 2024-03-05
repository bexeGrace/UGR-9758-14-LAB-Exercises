Future<int> fetchNumber() {
  return Future.delayed(Duration(seconds: 2), () {
    return 42; // Simulating a delayed computation
  });
}

void main() async {
  print('Fetching number...');
  int result = await fetchNumber();
  print('The fetched number is: $result');
}
