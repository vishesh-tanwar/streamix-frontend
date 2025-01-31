import 'package:flutter/material.dart';

class ListSection extends StatelessWidget {
  final List<String> label;
  final List<IconData> icon;

  const ListSection({super.key, required this.label, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        label.length,
        (index) {
          if (index == 4 || index == 6) {
            return Column(
              children: [
                const Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  indent: 2,
                  endIndent: 2,
                ),
                ListTile(
                  leading: Icon(icon[index], color: Colors.white),
                  title: Text(
                    label[index],
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  onTap: () {},
                ),
              ],
            );
          }

          return ListTile(
            leading: Icon(icon[index], color: Colors.white),
            title: Text(
              label[index],
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
