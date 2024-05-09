import 'package:orange/orange.dart';
import 'package:code_timer/code_timer.dart';

main() async {
  await Orange.init();
  // write
  Orange.setInt('counter', 10);
  Orange.setBool('repeat', true);
  Orange.setDouble('decimal', 1.5);
  Orange.setString('action', 'Start');

  // read
  print(Orange.getInt('counter'));
  print(Orange.getBool('repeat'));
  print(Orange.getDouble('decimal'));
  print(Orange.getString('action'));

  // remove
  Orange.remove('int');

  // performance test(10000 time writes)
  CodeTimer.start();
  for (int i = 0; i < 10000; i++) {
    Orange.setInt('int$i', 1);
  }
  CodeTimer.stop(label: 'write performance test');

  // performance test(10000 time reads)
  CodeTimer.start();
  for (int i = 0; i < 10000; i++) {
    Orange.getInt('int$i');
  }
  CodeTimer.stop(label: 'read performance test');

  CodeTimer.start();
  await Orange.isSavedToDisk();
  CodeTimer.stop(label: 'all data saved to disk!');
}
