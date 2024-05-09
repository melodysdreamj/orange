import 'package:orange/orange.dart';
import 'package:code_timer/code_timer.dart';

main() async {
  // write
  await Orange().setInt('counter', 10);
  await Orange().setBool('repeat', true);
  await Orange().setDouble('decimal', 1.5);
  await Orange().setString('action', 'Start');

  // read
  print(await Orange().getInt('counter'));
  print(await Orange().getBool('repeat'));
  print(await Orange().getDouble('decimal'));
  print(await Orange().getString('action'));

  // remove
  await Orange().remove('int');

  // performance test(10000 time writes)
  CodeTimer.start();
  for (int i = 0; i < 10000; i++) {
    await Orange().setInt('int$i', 1);
  }
  CodeTimer.stop(label: 'write performance test');

  // performance test(10000 time reads)
  CodeTimer.start();
  for (int i = 0; i < 10000; i++) {
    await Orange().getInt('int$i');
  }
  CodeTimer.stop(label: 'read performance test');
}
