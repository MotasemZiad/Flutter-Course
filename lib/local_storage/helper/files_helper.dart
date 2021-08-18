import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class FilesHelper {
  FilesHelper._();
  static FilesHelper filesHelper = FilesHelper._();

  writeToFile(String fileName) async {
    // ? Object Oriented Programming OOP
    // * 1. create Directory
    Directory directory = await getApplicationDocumentsDirectory();
    // * 2. create Path
    String filePath = join(directory.path, '$fileName.text');
    // String filePath2 = directory.path + '/$fileName.text'; // * another way of doing the same thing...

    // * 3. create File
    File file = File(filePath);
    // * 4. write to File
    file.writeAsString('Flutter Mastering');

    // ? Functional Programming FB
    // await getApplicationDocumentsDirectory().then((value) =>
    //     File(value.path + '/$fileName.text')
    //         .writeAsString('Flutter Mastering'));
  }

  Future<String> readFromFile(String fileName) async {
    var content = await getApplicationDocumentsDirectory().then(
        (value) => File(join(value.path, '$fileName.text')).readAsString());
    print(content);
    return content;
  }
}
