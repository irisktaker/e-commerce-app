import 'package:ecommerce_app/utils/constants/all_constants.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: SizeConfig.defaultPadding),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SizeConfig.defaultRadius),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                hintText: 'Search ...',
                prefixIcon: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: SizeConfig.defaultPadding,
                  ),
                  child: Image.asset(
                    'assets/icons/search.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
          ),
          MaterialButton(
            height: 60,
            minWidth: 60,
            onPressed: () {},
            padding: const EdgeInsets.all(0),
            child: Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.only(left: SizeConfig.defaultPadding),
              padding: const EdgeInsets.all(SizeConfig.defaultPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: 0.1,
                    blurRadius: 0.1,
                    offset: Offset(
                      0,
                      1,
                    ),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/icons/filter.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
