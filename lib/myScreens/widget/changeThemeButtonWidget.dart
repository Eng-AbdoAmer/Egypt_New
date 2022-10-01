import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../themes/app_themes.dart';

class ChangeTheameButtonWidget extends StatelessWidget {
  const ChangeTheameButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
        activeColor: Colors.white,
        value: themeProvider.isDarkmode,
        onChanged: (value) {
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          provider.changeTheme(value);
        });
  }
}
