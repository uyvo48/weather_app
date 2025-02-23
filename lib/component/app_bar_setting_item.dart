import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarSettingItem extends StatelessWidget implements PreferredSizeWidget {
  final String textSettingItem;

  const AppBarSettingItem({super.key, required this.textSettingItem});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          GoRouter.of(context).pop();
        },
        child: Container(
          padding: EdgeInsets.all(10),
          child: IconButton(
            onPressed: null,
            color: Colors.white,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
            ),
            icon: Icon(Icons.arrow_back_ios_rounded, size: 18),
          ),
        ),
      ),
      title: Text(
        textSettingItem,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      actions: [],
    );
  }
}
