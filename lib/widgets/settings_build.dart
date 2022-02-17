import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SettingsModal extends StatelessWidget {
  const SettingsModal({Key? key, this.title, required this.children})
      : super(key: key);

  final String? title;
  final List<SettingsItem> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
          ? Text(
              title!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )
          : const Padding(padding: EdgeInsets.only(top: 10)),
        const Padding(padding: EdgeInsets.only(top: 10)),
        Card(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: children,
          ),
        )
      ],
    );
  }
}

class SettingsItem extends StatelessWidget {
  SettingsItem(
      {Key? key,
      required this.icon,
      required this.title,
      this.value,
      this.iconColor,
      required this.onTap
    }) : super(key: key);

  final IconData icon;
  final String title;
  final String? value;
  Color? iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var _isDarkMode = Theme.of(context).brightness == Brightness.dark;
    iconColor ??= Colors.blue;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: iconColor,
            ),
            const Padding(padding: EdgeInsets.only(left: 20)),
            value != null
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 5)),
                Text(value!,
                  style: TextStyle(
                    color: _isDarkMode
                        ? Colors.white60
                        : Colors.black54
                  ),
                ),
              ],
            )
                : Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
              ),
            ),
          ],
        ),
      )
    );
  }
}
