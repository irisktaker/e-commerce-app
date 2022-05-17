import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/constants/all_constants.dart';

class TagsList extends StatelessWidget {
  const TagsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List _tagsList = ['Women', 'T-Shirts', 'Dress'];

    return SizedBox(
      height: 40,
      child: Row(
        children: _tagsList
            .map((e) => Container(
                  margin: const EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    color: AppColors.greyColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(e),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
