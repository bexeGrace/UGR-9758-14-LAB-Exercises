import 'dart:io';

void throwException() {
  throw Exception('This is an exception!');
}

// Excercise 2

void readFile() {
  File file = File('nonexistent_file.txt');
  file.readAsStringSync();
}

void main() {
  try {
    throwException();
  } catch (e) {
    print('Exception caught: $e');
  }

// Excercise 2

  try {
    readFile();
  } on FileSystemException catch (e) {
    print('File not found error caught: $e');
  }
}
