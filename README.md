# Flutter Hive（本地 NoSQL 盒）

## 简介

用 **`hive_flutter`** 初始化 Hive，打开一个 `Box<String>`，写入键 `name`，首屏直接显示读到的值。适合离线缓存、小型配置、比 SharedPreferences 更结构化的键值。

## 快速开始

### 环境要求

Flutter SDK。

### 运行

```bash
flutter pub get
flutter run
```

## 概念讲解

### 第一部分：为什么 `Hive.initFlutter`

在 Flutter 里需要先 `WidgetsFlutterBinding.ensureInitialized()`，再 `await Hive.initFlutter()`，插件会选好各端存储目录。纯 Dart 脚本则用 `Hive.init(path)`。

### 第二部分：Box 与类型

`openBox<String>` 表示值为 String；自定义类需注册 `TypeAdapter`。Demo 保持最小，只用字符串。

## 完整示例

见 `lib/main.dart`：`main` 异步初始化、`MyApp` 接收 `box` 并展示 `box.get('name')`。

## 注意事项

- Web 与 Desktop 存储实现与移动端不同，上线前请在目标平台实测。
- 敏感数据应配合系统 Keychain/Keystore 或加密层，勿把 Hive 当唯一安全边界。

## 完整讲解（中文）

Hive 可以理解为「**带类型的本地抽屉柜**」：每个 Box 是一组键值，读写快、依赖少。比 SQLite 轻，比纯 SharedPreferences 更适合以后要存一点小对象（配好 Adapter 后）。本 Demo 只做字符串，是提醒你：**先确认 init 与 openBox 顺序正确**，再谈复杂模型；否则常见问题全是「路径没初始化」或「没注册 Adapter」。
