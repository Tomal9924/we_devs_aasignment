import 'package:dokan/core/shared/extensions/theme.dart';

import 'shared.dart';

// ignore: must_be_immutable
class Input extends StatefulWidget {
  final TextEditingController controller;
  final IconData icon;
  final TextInputType type;
  final String hint;
  final String? Function(String?) validator;
  final String Function(String) onChanged;
  late bool validate;

  @override
  State<Input> createState() => _InputState();

  Input({
    super.key,
    required this.controller,
    required this.icon,
    required this.type,
    required this.validator,
    this.validate = false,
    required this.onChanged,
    required this.hint,
  });
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final theme = state.scheme;
        return PhysicalModel(
          color: theme.backgroundColor,
          elevation: 2,
          borderRadius: BorderRadius.circular(16),
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.type,
            validator: widget.validator,
            autocorrect: false,
            autofocus: false,
            onChanged: (value) {
              setState(() {
                widget.validate = true;
                widget.onChanged(widget.controller.text);
              });
            },
            decoration: InputDecoration(
              fillColor: theme.white,
              hintText: widget.hint,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.greenAccent),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.red),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              prefixIcon: Icon(
                widget.icon,
                size: 20.sp,
              ),
            ),
          ),
        );
      },
    );
  }
}
