import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class FileHelper {
  static Future<String> getDownloadDirectory() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<bool> fileExists(
      String filePath, int fileId, String fileName) async {
    final downloadDirectory = await getDownloadsDirectory();
    String type = fileExtension(filePath);
    final file = File('${downloadDirectory!.path}/$fileName$fileId.$type');
    return await file.exists();
  }

  static String fileExtension(String filePath) {
    List<String> temp = filePath.split('/');
    String type = temp.last.split('.')[1];
    return type;
  }

  static Future<void> openFile(
      String filePath, int fileId, String fileName) async {
    final downloadDirectory = await getDownloadsDirectory();
    String type = fileExtension(filePath);
    String path = '${downloadDirectory!.path}/$fileName$fileId.$type';
    final file = File(path);
    if (await file.exists()) {
      await OpenFile.open(path);
    }
  }
}
