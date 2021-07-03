import 'package:flutter/material.dart';
import '../values/custom_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class GitHubIconButton extends StatelessWidget {
  const GitHubIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _launchURL,
      icon: const Icon(CustomIcons.github),
      color: Colors.white,
    );
  }

  void _launchURL() async => await launch(_GITHUB_URL);

  static const _GITHUB_URL =
      'https://github.com/toureholder/flutter_adaptive_layout_tutorial#readme';
}
