[![pub package](https://img.shields.io/pub/v/orange.svg)](https://pub.dartlang.org/packages/orange)
[![GitHub](https://img.shields.io/github/stars/melodysdreamj/orange.svg?style=social&label=Star)](https://github.com/melodysdreamj/orange)



# Orange Database 🍊
[![Discord Server Invite](https://img.shields.io/badge/DISCORD-JOIN%20SERVER-5663F7?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/zXXHvAXCug)
[![Kakao_Talk](https://img.shields.io/badge/KakaoTalk-Join%20Room-FEE500?style=for-the-badge&logo=kakao)](https://open.kakao.com/o/gEwrffbg)

## Features

- ✨ **Super Fast Speed**  100 x faster than SharedPreference
- 🦄 **Super Easy**: No initialization required, same api as SharedPreference
- 🚀 **All Environment Work**: Working on Android, iOS, Web, Mac, Windows, Linux even cli.
- 🌐 **No Build Runner**: Do not waste your time on build_runner


## Benchmark
read & write 10000 times with Orange Database 🍊 and shared_preferences
```
Execution orange 🍊 write performance test time: 120 ms
Execution orange 🍊 read performance test time: 9 ms
Execution shared_preferences write performance test time: 49228 ms
Execution shared_preferences read performance test time: 28 ms
```
you can re run the benchmark test this [repository](https://github.com/melodysdreamj/benchmark_for_orange_database)

## Installation
```bash
flutter pub add orange
```

## Usage
```dart
await Orange.setString('orange', 'is delicious! 🍊');

String? orange = await Orange.getString('orange');
print(orange); // is delicious! 🍊

await Orange.remove('orange');
```
you got all usage of Orange now! 🎉

## Advanced Usage

### Initialize
if you need initialize first, you can use `Orange.init()` method.
this is useful when handling a large amount of data. because orange database need load data from disk when first access.
```dart
await Orange.init();
```

### Check Saved Disk Time
if you want to check if the data is saved on disk, you can use `Orange.isSavedToDisk()` method.
```dart
bool isSaved = await Orange.isSavedToDisk('orange');
print(isSaved); // true
```
