import 'enums/enum.dart';
import 'shared.dart';

class FormValidator {
  late bool isValid = true;
  late bool isObscure = false;
  late TextEditingController controller;
  late String? validationMessage = "";
  late final FormType type;

  initialize({
    required TextEditingController controller,
    required FormType type,
  }) {
    this.controller = controller;
    this.type = type;
  }

  validate() {
    switch (type) {
      case FormType.email:
        isValid = controller.text.isNotEmpty;
        validationMessage = (isValid ? null : "*email is required")!;
        break;
      case FormType.password:
        isValid = controller.text.isNotEmpty;
        validationMessage =
            (validationMessage = (isValid ? null : "*password is required")!);
        break;
    }
  }

  void toggleObscure() {
    if (type == FormType.password) {
      isObscure = !isObscure;
    }
  }
}
