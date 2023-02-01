import 'package:flutter/material.dart';

class AddBottomSheetWidget extends StatelessWidget {
  const AddBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Create',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  iconSize: 30,
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.clear_outlined))
            ],
          ),
        ),
        const Divider(),
        buildIcons('Watch Now', Icons.watch_later_outlined),
        const SizedBox(height: 10),
        buildIcons('Go Live', Icons.live_tv),
        const SizedBox(height: 10),
        buildIcons('Live video', Icons.video_call),
        const SizedBox(height: 10),
        buildIcons('Upload a video', Icons.upload),
      ],
    );
  }

  Widget buildIcons(String title, IconData icon) => ListTile(
        onTap: () {},
        leading: CircleAvatar(
          radius: 23,
          child: Icon(icon, size: 22),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      );
}
