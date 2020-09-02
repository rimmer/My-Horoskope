import 'dart:io';

void main(List<String> args) {
  final dir = args[0] ?? Directory.current;
  new Directory(dir).listSync(recursive: true).forEach((entity) {
    if (entity is Directory) return;

    final fileName = entity.path.split(Platform.pathSeparator)?.last;
    if (fileName == 'pubspec.yaml') {
      final path = entity.path.replaceFirst(fileName, '');

      // It seems suffiecient to run `pub get` for either flutter
      // or non-flutter package
      final result = Process.runSync('pub', ['get'],
          workingDirectory: path, runInShell: true);

      stdout.writeln("Navigating into ${path}");
      (result.exitCode == 0)
          ? stdout.writeln(result.stdout)
          : stderr.writeln(result.stderr);
    }
  });
}
