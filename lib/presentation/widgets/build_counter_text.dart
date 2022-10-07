import 'package:flutter/material.dart';

class BuildCounterText extends StatelessWidget {
  final String _text;
  const BuildCounterText({
    Key? key,
    required String text,
  })  : _text = text,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
