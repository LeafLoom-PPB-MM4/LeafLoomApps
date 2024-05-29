import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leafloom/utils/constants/icons_constans.dart';
import 'package:leafloom/utils/constants/image_strings.dart';
import 'package:leafloom/utils/theme/custon_themes/text_theme.dart';

class ImageLoader extends StatelessWidget {
  const ImageLoader(
      {super.key,
      required this.text,
      required this.image,
      this.showAction = false,
      this.actionText,
      this.onActionPressed});

  final String text, image;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(LImages.banner1),
          const SizedBox(
            height: 18,
          ),
          Text(
            text,
            style: LTextTheme.latoBold12,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 18,
          ),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    child: Text(actionText!,
                        style: LTextTheme.latoBold12.copyWith(
                          color: Colors.black,
                        )),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
