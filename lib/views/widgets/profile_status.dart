import 'package:flutter/material.dart';

class ProfileStatsWidget extends StatelessWidget {
  final String score, title;

  const ProfileStatsWidget({
    Key? key,
    required this.title,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "$score",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(height: 5),
        Text(
          "$title",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
