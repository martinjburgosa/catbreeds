import 'dart:io';

class SaveDataPath {
  SaveDataPath(){
    directory = Directory.systemTemp;
  }

  late final Directory directory;

  Future<String> getPath() async {
    final dir = await directory.createTemp('bckData');
    return dir.path;
  }
}