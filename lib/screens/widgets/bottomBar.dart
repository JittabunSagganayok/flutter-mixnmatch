import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonType {
  unlike,
  favorite,
  like
}

class BottomBar extends StatelessWidget {
  final Function(ButtonType) onButtonTap;

  const BottomBar({Key? key, required this.onButtonTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.1.sh,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
            // buttonWidget(Icons.refresh, Colors.amber),
          buttonWidget(Icons.close, Colors.red, ButtonType.unlike),
          buttonWidget(Icons.star, Colors.blue, ButtonType.favorite),
          buttonWidget(Icons.favorite_outline_outlined, Colors.pink, ButtonType.like),
        // buttonWidget(Icons.bolt, Colors.purple)
        ]
      ),
    );
  }

  Widget buttonWidget(IconData icon, Color color, ButtonType type) {
    return GestureDetector(
      onTap: () => onButtonTap(type),
      child: Container(
        height: 0.08.sh,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: color)
        ),
        child: Icon(
          icon,
          color: color,
          size: 30,
        ),
      ),
    );
  }
}


