Future<void> fetchData() {
  return Future.delayed(Duration(seconds: 2), () {
    print('Fetching data...');
  });
}

void main() async {
  print('Before fetching data');
  await fetchData();
  print('After fetching data');
}
