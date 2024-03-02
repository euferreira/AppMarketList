import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoryEmpty extends StatelessWidget {
  const CategoryEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: context.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/svgs/not_found.svg"),
          Text(
            "Nada por aqui :(",
            style: context.textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
