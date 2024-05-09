[![pub package](https://img.shields.io/pub/v/orange.svg)](https://pub.dartlang.org/packages/orange)
[![GitHub](https://img.shields.io/github/stars/melodysdreamj/orange.svg?style=social&label=Star)](https://github.com/melodysdreamj/orange)



# Orange Database 🍊
[![Discord Server Invite](https://img.shields.io/badge/DISCORD-JOIN%20SERVER-5663F7?style=for-the-badge&logo=discord&logoColor=white)](https://discord.gg/zXXHvAXCug)
[![Kakao_Talk](https://img.shields.io/badge/KakaoTalk-Join%20Room-FEE500?style=for-the-badge&logo=kakao)](https://open.kakao.com/o/gEwrffbg)

## Features

- ✨ **Super Fast Speed**  100 x faster than SharedPreference
- 🦄 **Super Easy**: No initialization required, same api as SharedPreference
- 🚀 **All Environment Work**: working on Android, iOS, Web, Mac, Windows, Linux even cli.
- 🌐 **No Build Runner**: do not waste time on build_runner

## Installation
```bash
flutter pub add orange
```

## Usage
```dart
await Orange().setString('orange', 'is delicious! 🍊');

String orange = await Orange().getString('orange');
print(orange); // is delicious! 🍊

await Orange().remove('orange');
```
you got all usage of Orange now! 🎉
