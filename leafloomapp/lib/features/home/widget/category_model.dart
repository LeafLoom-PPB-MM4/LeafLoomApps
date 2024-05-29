import 'package:flutter/material.dart';
import 'package:leafloom/utils/constants/icons_constans.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 120, // Increased height to accommodate icon and label
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(width: 16),
          itemCount: 4,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return _buildIconButton(IconsConstant.pakaian, 'Pakaian');
              case 1:
                return _buildIconButton(IconsConstant.tas, 'Tas');
              case 2:
                return _buildIconButton(IconsConstant.sepatu, 'Sepatu');
              case 3:
                return _buildIconButton(IconsConstant.lainnya, 'Lainnya');
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildIconButton(String assetName, String label) {
    return Column(
      children: [
        IconButton(
          icon: Image.asset(
            assetName,
            width: 50,
            height: 50,
          ),
          onPressed: () {
            // Add onPressed action if needed
          },
        ),
        // Spacer between icon and label
        Text(label),
      ],
    );
  }
}
