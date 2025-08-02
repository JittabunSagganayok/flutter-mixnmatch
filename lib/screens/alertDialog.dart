import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mixnmatch/screens/widgets/dialog_widgets/error_dialog_widget.dart';

// import 'package:flutter_tinder/widgets/bottomBar.dart';
Widget buttonWidget(IconData icon, Color color) {
  return Container(
    height: 60,
    width: 60,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: color)),
    child: Icon(
      icon,
      color: color,
      size: 30,
    ),
  );
}

actions(BuildContext context, String name, type) {
  showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop(true);
        });

        return AlertDialog(
          content: buttonWidget(
              type == 'Liked'
                  ? Icons.favorite
                  : type == 'Rejected'
                      ? Icons.close
                      : Icons.star,
              type == 'Liked'
                  ? Colors.pink
                  : type == 'Rejected'
                      ? Colors.red
                      : Colors.blue),
          title: Text(
            'You ${type} ${name}',
            style: TextStyle(
                color: type == 'Liked'
                    ? Colors.pink
                    : type == 'Rejected'
                        ? Colors.red
                        : Colors.blue),
          ),
        );
      });
}

actionsIg(BuildContext context, String name, type, String ig) {
  showDialog(
      context: context,
      builder: (context) {
        // Future.delayed(Duration(seconds: 1), () {
        //   Navigator.of(context).pop(true);
        // });

        return
            // ErrorDialogWidget(
            //     title: "Error",
            //     content: "Invalid QRcode",
            //     onSubmit: () {
            //       Get.back();
            //     });
            AlertDialog(
          content: buttonWidget(
              type == 'Liked'
                  ? Icons.favorite
                  : type == 'Rejected'
                      ? Icons.close
                      : Icons.star,
              type == 'Liked'
                  ? Colors.pink
                  : type == 'Rejected'
                      ? Colors.red
                      : Colors.blue),
          title: Column(
            children: [
              Text(
                '${name} Also ${type} You',
                style: TextStyle(
                    color: type == 'Liked'
                        ? Colors.pink
                        : type == 'Rejected'
                            ? Colors.red
                            : Colors.blue),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // Set a white background with some padding
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey
                              .withOpacity(0.2), // Add a subtle shadow
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),

                    child: ClipOval(
                      // Clip the child widget to a circle
                      child: FadeInImage(
                        // Use FadeInImage for smooth loading animation
                        placeholder: const AssetImage(
                            'assets/mixnmatch.png'), // Placeholder image
                        image: AssetImage('assets/ig.png'),
                        fit: BoxFit.cover,
                        width: 40, // Ensure image fills the circle
                      ),
                    ),
                  ),
                  Text(" ${ig}",
                      style: TextStyle(
                          fontFamily: 'kanit',
                          color: type == 'Liked'
                              ? Colors.pink
                              : type == 'Rejected'
                                  ? Colors.red
                                  : Colors.blue)),
                ],
              ),
            ],
          ),
        );
      });
}
