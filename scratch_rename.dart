import 'dart:io';

void main() {
  void renameFiles(String path, String prefix) {
    var dir = Directory(path);
    if (!dir.existsSync()) return;
    
    var files = dir.listSync().whereType<File>().toList();
    files.sort((a, b) => a.path.compareTo(b.path)); // sort by old name just in case
    
    int i = 1;
    for (var f in files) {
      if (f.path.contains('WhatsApp') || f.path.contains('(')) {
        String num = i.toString().padLeft(2, '0');
        String newName = '$prefix-$num.jpeg';
        f.renameSync('$path/$newName');
        print('Renamed \${f.path} to $path/$newName');
        i++;
      }
    }
  }

  renameFiles('web/images/graphic_design', 'brand-campaign');
  renameFiles('web/images/t-shirt_mockups', 'shirt-mockup');
}
