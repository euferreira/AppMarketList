# market_list

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Hive

- Como Gerar arquivo Adapter.
- 1. Criar o arquivo em hive/models com @HiveType junto da classe e forneça um typeId(entre 0 e 223).
- 2. Anote todos os campos que devem ser armazenados com@HiveField.
- 3. Adicione abaixo dos imports: `part '{nome do arquivo}.g.dart;` .
- 4. Executar tarefa de compilação: `dart run build_runner build`.