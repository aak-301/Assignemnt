import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class Helper {
  static Future<String> convertIntoBase64(File file) async {
    Uint8List bytes = file.readAsBytesSync();
    String base64Image = base64Encode(bytes);
    return base64Image;
  }
}
