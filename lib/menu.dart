import 'dart:io';

class Menu<T> {
  final Map<int, String> options;
  final String title;

  Menu(this.title, this.options);

  void display() {
    print(title);
    options.forEach((key, value) {
      print("$key: $value");
    });
  }

  int? getUserChoice() {
    String? input = stdin.readLineSync();
    int? choice = int.tryParse(input ?? '');
    if (choice != null && options.containsKey(choice)) {
      print('Your choice: ${options[choice]}');
      return choice;
    }
    return null;
  }
}
