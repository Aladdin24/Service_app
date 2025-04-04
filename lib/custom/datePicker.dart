import 'package:flutter/material.dart';

class DateDropDown extends StatelessWidget {
  final String labelText;
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;

  const DateDropDown({
    required this.labelText,
    required this.valueText,
    required this.valueStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: InputDecorator(
        decoration: InputDecoration(labelText: labelText),
        baseStyle: valueStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              valueText,
              style: valueStyle,
            ),
            Icon(
              Icons.date_range,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.orange[200]
                  : Colors.white70,
            )
          ],
        ),
      ),
    );
  }
}
