import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> main() async {
  final List<String> urls = [
    'https://example.com/file1.txt',
    'https://example.com/file2.txt',
    'https://example.com/file3.txt',
  ];

  final List<Future<void>> downloadFutures = [];

  for (int i = 0; i < urls.length; i++) {
    final url = urls[i];
    final fileName = 'file${i + 1}.txt';

    final downloadFuture = _downloadFile(url, fileName);
    downloadFutures.add(downloadFuture);

    downloadFuture.then((_) {
      print('Download of $url completed');
    }).catchError((error) {
      print('Error occurred while downloading $url: $error');
    });
  }

  try {
    await Future.wait(downloadFutures);
    print('All downloads completed successfully');
  } catch (error) {
    print('Error occurred during downloads: $error');
  }
}

Future<void> _downloadFile(String url, String fileName) async {
  final request = http.Request('GET', Uri.parse(url));
  final http.StreamedResponse response = await http.Client().send(request);
  final File file = File(fileName);
  final IOSink sink = file.openWrite();

  int received = 0;
  final total = response.contentLength;

  response.stream.listen(
    (List<int> chunk) {
      sink.add(chunk);
      received += chunk.length;
      if (total != null) {
        final percentage = (received / total * 100).toStringAsFixed(2);
        print('Downloaded $percentage% of $fileName');
      }
    },
    onDone: () {
      sink.close();
    },
    onError: (error) {
      sink.close();
    },
    cancelOnError: true,
  );
}
