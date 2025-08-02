import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_tinder/widgets/bottomBar.dart';
import 'package:mixnmatch/screens/widgets/bottomBar.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.05.sh,
      // color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // buttonWidget(Icons.star, Colors.amber),
          imageWidget('assets/images.jpeg'),
          imageWidget('assets/diamond.png'),
          // buttonWidget(Icons.notifications, Colors.grey.shade400)
        ],
      ),
    );
  }
}

Widget imageWidget(String image) {
  return Container(
    height: 0.05.sh,
    width: 50,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
  );
}
