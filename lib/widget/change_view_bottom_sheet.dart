import 'package:flutter/material.dart';

class ChangeViewBottomSheet extends StatelessWidget {
  final int selectedTile;
  final VoidCallback? onItemOneTap;
  final VoidCallback? onItemTwoTap;
  const ChangeViewBottomSheet({
    Key? key,
    this.selectedTile = 0,
    this.onItemOneTap,
    this.onItemTwoTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        children: [
          ListTile(
            onTap: onItemOneTap,
            leading: const Icon(Icons.library_music),
            title: const Text('Library'),
            trailing: selectedTile == 0
                ? const Icon(Icons.check)
                : const SizedBox.shrink(),
          ),
          ListTile(
            onTap: onItemTwoTap,
            leading: const Icon(Icons.phone_android),
            trailing: selectedTile == 1
                ? const Icon(Icons.check)
                : const SizedBox.shrink(),
            title: const Text('Device'),
          ),
        ],
      ),
    );
  }
}
