// import "package:mixnmatch/components/doctor_card.dart";
// import "package:flutter/material.dart";
// import "package:flutter_screenutil/flutter_screenutil.dart";
// import "package:mixnmatch/screens/alertDialog.dart";
// import "package:mixnmatch/screens/widgets/appBar.dart";
// import "package:mixnmatch/screens/widgets/bottomBar.dart";
// import "package:provider/provider.dart";
// import "package:swipe_cards/swipe_cards.dart";

// import "../models/auth_model.dart";

// class TinderPage extends StatefulWidget {
//   const TinderPage({Key? key}) : super(key: key);

//   @override
//   _TinderPageState createState() => _TinderPageState();
// }

// class _TinderPageState extends State<TinderPage> {

//   List<SwipeItem> _swipeItems = <SwipeItem>[];
//   MatchEngine? _matchEngine;
//   List<String> names = [
//     'Andrews',
//     'Master G',
//     'Cristine',
//     'Grammys',
//     'Alex GH'
//   ];
//   List images = [
//     'assets/image1.jpeg',
//     'assets/image2.jpeg',
//     'assets/image3.png',
//     'assets/image4.jpeg',
//     'assets/image5.jpg'
//   ];

//   @override
//   void initState() {
//     for (int i = 0; i < names.length; i++) {
//       _swipeItems.add(SwipeItem(
//           content: Content(text: names[i]),
//           likeAction: () {
//             //เปลี่ยน actions เป็น ig คนนั้น
//             actions(context, names[i], 'Liked');
//             print('Liked');
//             // ส่ง post api ตรงนี้
//           },
//           nopeAction: () {
//             actions(context, names[i], 'Rejected');
//             print('Rejected');
//           },
//           superlikeAction: () {
//             actions(context, names[i], 'Liked');
//             print('Liked');
//           }));
//     }
//     _matchEngine = MatchEngine(swipeItems: _swipeItems);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: [
//             // SizedBox(height: 0.1.sh),

//             SizedBox(height: 0.075.sh),
//             Text(
//               'ปัดซ้ายหรือขวา',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontFamily: 'Kanit',
//                   fontSize: 28,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.white),
//             ),
//             Text(
//               'เพื่อหาแอดเพื่อนได้เลย !',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontFamily: 'Kanit',
//                   fontSize: 18,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.white),
//             ),
//             SizedBox(height: 0.005.sh),
//             // TopBar(),
//             Expanded(
//                 child: Container(
//               child: SwipeCards(
//                 matchEngine: _matchEngine!,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Container(
//                     alignment: Alignment.bottomLeft,
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                             image: AssetImage(images[index]),
//                             fit: BoxFit.cover),
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(10)),
//                     padding: EdgeInsets.all(20),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "${names[index]}",
//                           style: TextStyle(
//                               fontSize: 32,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         Text(
//                           "Male 23",
//                           style: TextStyle(
//                               fontSize: 22,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w600),
//                         )
//                       ],
//                     ),
//                   );
//                 },
//                 onStackFinished: () {
//                   return ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('The List is over')));
//                 },
//               ),
//             )),
//             BottomBar(onButtonTap: handleButtonTap),
//             SizedBox(height: 0.01.sh),
//           ],
//         ),
//       ),
//     );
//   }

//   void handleButtonTap(ButtonType type) {
//     switch (type) {
//       case ButtonType.unlike:
//         _matchEngine!.currentItem?.nope();
//         break;
//       case ButtonType.favorite:
//       case ButtonType.like:
//         _matchEngine!.currentItem?.like();
//         break;
//     }
//   }
// }

// class Content {
//   final String? text;
//   Content({this.text});
// }

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:mixnmatch/controllers/tinder_controller.dart';
import 'package:mixnmatch/screens/alertDialog.dart';
import 'package:mixnmatch/screens/widgets/bottomBar.dart';
import 'package:swipe_cards/swipe_cards.dart';

class TinderPage extends StatefulWidget {
  const TinderPage({Key? key}) : super(key: key);

  @override
  _TinderPageState createState() => _TinderPageState();
}

class _TinderPageState extends State<TinderPage> {
  final TinderController tinderController = Get.put(TinderController());
  MatchEngine? _matchEngine;

  @override
  void initState() {
    super.initState();
    // _initializeSwipeItems();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeSwipeItems();
    });
  }

  void _initializeSwipeItems() {
    List<SwipeItem> swipeItems = tinderController.userList.map((user) {
      return SwipeItem(
        content: user,
        likeAction: () async {
          var match =
              await tinderController.submitSwipe(targetUserId: user['userId']);
          match == true
              ? actionsIg(context, user['username'], 'Liked', user['ig_user'])
              : actions(context, user['username'], 'Liked');
// ถ้า true : actionsIg
// ถ้า false :  actions(context, user['username'], 'Liked');

          print('Liked ${user['username']}');
        },
        nopeAction: () {
          actions(context, user['username'], 'Rejected');
          print('Rejected ${user['username']}');
          // TODO: Implement API call for reject action
        },
        superlikeAction: () {
          actions(context, user['username'], 'Liked');
          print('Liked ${user['username']}');
          // TODO: Implement API call for superlike action
        },
      );
    }).toList();

    setState(() {
      _matchEngine = MatchEngine(swipeItems: swipeItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.red.shade500.withOpacity(0.5)],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 0.075.sh),
            Text(
              'ปัดซ้ายหรือขวา',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Kanit',
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Text(
              'เพื่อหาแอดเพื่อนได้เลย !',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Kanit',
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 0.025.sh),
            Expanded(
              child: Obx(() {
                if (tinderController.isLoading.value) {
                  return Center(
                      child: CircularProgressIndicator(color: Colors.white));
                } else if (tinderController.userList.isEmpty) {
                  return Center(
                      child: Text('No users available',
                          style: TextStyle(color: Colors.white)));
                } else {
                  return Container(
                    child: _matchEngine != null
                        ? SwipeCards(
                            matchEngine: _matchEngine!,
                            itemBuilder: (BuildContext context, int index) {
                              final user = tinderController.userList[index];
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(user['avatar']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black.withOpacity(0.8)
                                      ],
                                    ),
                                  ),
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${user['username']}",
                                        style: TextStyle(
                                          fontSize: 32,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${user['gender']}, ${user['age']}",
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            onStackFinished: () {
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   SnackBar(
                              //       content: Text('No more users available')),
                              // );
                            },
                          )
                        : Center(
                            child: Text('Loading users...',
                                style: TextStyle(color: Colors.white))),
                  );
                }
              }),
            ),
            BottomBar(onButtonTap: handleButtonTap),
            SizedBox(height: 0.01.sh),
          ],
        ),
      ),
    );
  }

  void handleButtonTap(ButtonType type) {
    if (_matchEngine == null || _matchEngine!.currentItem == null) return;

    switch (type) {
      case ButtonType.unlike:
        _matchEngine!.currentItem?.nope();
        break;
      case ButtonType.favorite:
      case ButtonType.like:
        _matchEngine!.currentItem?.like();
        break;
    }
  }
}
