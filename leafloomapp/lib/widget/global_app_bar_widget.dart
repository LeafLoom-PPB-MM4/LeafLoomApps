import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:leafloom/utils/constants/colors.dart';
import 'package:leafloom/utils/constants/icons_constans.dart';
import 'package:leafloom/utils/theme/custon_themes/text_theme.dart';

class GlobalAppBar extends StatelessWidget {
  final VoidCallback? onSearch;
  final VoidCallback? onCart;
  final VoidCallback? onNotification;
  final TextEditingController
      searchController; // Tambahkan parameter controller

  GlobalAppBar({
    Key? key,
    this.onSearch,
    this.onCart,
    this.onNotification,
    required this.searchController, // Tambahkan parameter required
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight + 100, // Set custom height
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
                  controller:
                      searchController, // Gunakan controller yang diberikan
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8), // Add 8px padding for spacing
                      child: SvgPicture.asset(
                        IconsConstant.search,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
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
}
