import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Icon _icon;
  final void Function()? _onPressed;
  const CustomIconButton({
    Key? key,
    required Icon icon,
    required void Function()? onPressed,
  })  : _icon = icon,
        _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: _onPressed,
      color: Colors.blue,
      textColor: Colors.white,
      padding: const EdgeInsets.all(16),
      shape: const CircleBorder(),
      child: _icon,
    );
  }
}
