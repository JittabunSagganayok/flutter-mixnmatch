import 'package:flutter/material.dart';
import 'package:mixnmatch/gen/assets.gen.dart';



class EmptyList extends StatelessWidget {
  const EmptyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height -
          kToolbarHeight -
          kBottomNavigationBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.noList.path,
            width: MediaQuery.of(context).size.width * .3,
          ),
          const SizedBox(height: 8),
          const Text('ไม่มีรายการ')
        ],
      ),
    );
  }
}
