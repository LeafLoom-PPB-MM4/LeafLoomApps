import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leafloom/utils/constants/colors.dart';
import 'package:leafloom/utils/constants/icons_constans.dart';
import 'package:leafloom/utils/theme/custon_themes/text_theme.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onSearch;
  final VoidCallback? onCart;
  final VoidCallback? onNotification;

  const GlobalAppBar({
    super.key,
    this.onSearch,
    this.onCart,
    this.onNotification,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight + 80.0, // Set custom height
      color: LColors.primaryLight,
      child: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 30, right: 12, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8), // Add 8px padding for spacing
                      child: SvgPicture.asset(
                        IconsConstant.search,
                      ),
                    ),
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 24,
                      minHeight: 24,
                    ),
                    hintText: 'Cari Produk',
                    hintStyle: LTextTheme.latoSemiBold14
                        .copyWith(color: LColors.lightGrey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: LColors.primaryNormal),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: LColors.primaryNormal),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: LColors.primaryNormal),
                    ),
                    filled: false,
                  ),
                  onSubmitted: (value) =>
                      onSearch?.call(), // Call onSearch function when submitted
                ),
              ),
              IconButton(
                icon: SvgPicture.asset(IconsConstant.cart),
                onPressed: onCart,
                iconSize: 24,
              ),
              IconButton(
                icon: SvgPicture.asset(
                  IconsConstant.notification,
                ),
                onPressed: onNotification,
                iconSize: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + 40.0); // Matches container height
}
