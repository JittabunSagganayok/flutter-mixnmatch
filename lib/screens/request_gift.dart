import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:mcic_app/provider/price_format_provider.dart';
// import 'package:mcic_app/user/components/alert/credit/credit_alert.dart';
// import 'package:mcic_app/constant/styles_constants.dart';
// import 'package:mcic_app/user/view/credit/credit_controller.dart';
// import 'package:mcic_app/user/view/credit/provider/check_credit_provider.dart';
// import 'package:mcic_app/widget/trip_plan/trip_plan_image_form.dart';
// import 'package:mcic_app/widgets/s_button.dart';
// import 'package:pattern_formatter/pattern_formatter.dart';

import 'package:loader_overlay/loader_overlay.dart';
import 'package:mixnmatch/constant/styles_constants.dart';
import 'package:mixnmatch/controllers/point_controller.dart';
import 'package:mixnmatch/screens/widgets/dialog_widgets/error_dialog_widget.dart';
import 'package:mixnmatch/screens/widgets/dialog_widgets/s_button.dart';
import 'package:mixnmatch/screens/widgets/dialog_widgets/success_dialog_widget.dart';
import 'package:mixnmatch/utils/config.dart';

// import 'models/credit-model.dart';

class RequestCredit extends StatefulHookConsumerWidget {
  const RequestCredit({
    Key? key,
    // this.cartCredit,
  }) : super(key: key);

  // final CreditModel? cartCredit;

  @override
  ConsumerState<RequestCredit> createState() => _RequestCreditState();
}

class _RequestCreditState extends ConsumerState<RequestCredit> {
  // final CreditController creditcon = Get.put(CreditController());
  final PointSelectController c = Get.put(PointSelectController());

  final formKey = GlobalKey<FormState>();
  final creditAmountController = TextEditingController();
  String reasonSelected = '';
  final otherReasonController = TextEditingController();

  @override
  void initState() {
    c.isEnableSubmit.value = false;
    // creditcon.firstreason.value = "";
    // creditcon.secreason.value = "";
    // creditcon.money.value = 0;
    super.initState();
  }

  final focusNode = FocusNode();

  final thbFmt = NumberFormat.currency(locale: "th_TH", symbol: "฿");
  @override
  Widget build(BuildContext context) {
    final images = useState<List<String>>([]);

    var credit = double.parse("5000");
    var currentCredit = double.parse("3000");
    var creditLimit = 10000;
    var creditUsage = credit - currentCredit;
    double percenOfUseage =
        double.parse((creditUsage / credit).toStringAsFixed(2));
    if (percenOfUseage >= 0.9 && percenOfUseage < 1.0) {
      percenOfUseage = 0.90;
    }
    if (true) {
      creditLimit = 9000;
    }

    return LoaderOverlay(
        useDefaultLoading: false,
        overlayOpacity: 0.5,
        overlayColor: Colors.black.withOpacity(0.5),
        overlayWidget: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        child: Scaffold(
          backgroundColor: Color(0xFF1D1D1D),
          appBar: AppBar(
            backgroundColor: Config.primaryColor,
            automaticallyImplyLeading: false,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(LineAwesomeIcons.angle_left_solid)),
            title: Text(
              'แลกของรางวัล',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(19),
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontFamily: 'kanit'),
            ),
          ),
          body: GestureDetector(
            onTap: () {
              focusNode.unfocus();
            },
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.04.sw, vertical: 0.03.sw),
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(bottom: 0.06.sw),
                                    child: Obx(
                                      () => Text(
                                        'แต้มที่มี ${c.mypoint.value} ',
                                        style: TextStyle(
                                            color: Config.primaryColor,
                                            fontSize: ScreenUtil().setSp(19),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'kanit'),
                                      ),
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 0.02.sw),
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: 'เลือกโปรโมชั่น ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontFamily: 'Kanit',
                                          ),
                                        ),
                                      ],
                                    ),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: ScreenUtil().setSp(11),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                RedeemPromoDropdown(
                                    promolist: c.promolist.value),

                                // Focus(
                                //   onFocusChange: (value) {},
                                //   child:
                                //  DropdownButtonFormField(
                                //   validator: (value) {
                                //     if (value == null || value.isEmpty) {
                                //       return 'กรุณาระบุเหตุผล';
                                //     }
                                //     return null;
                                //   },
                                //   items:
                                //   creditcon.reason.map((value) {
                                //     return DropdownMenuItem<String>(
                                //       value: value,
                                //       child: Text(value),
                                //     );
                                //   }).toList(),
                                //   onChanged: (String? value) {
                                //     setState(() {
                                //       reasonSelected = value ?? '';
                                //     });
                                //   },
                                //   decoration: txtFieldDecoration.copyWith(
                                //     hintText: 'ระบุเหตุผล',
                                //   ),
                                // ),
                                //     TextFormField(
                                //   controller: creditAmountController,
                                //   validator: (value) {
                                //     value = stringToDouble(value.toString())
                                //         .toStringAsFixed(2);

                                //     try {
                                //       value = value?.trim();
                                //       if (value == null || value.isEmpty) {
                                //         return "กรุณาใส่จำนวนเงิน";
                                //       }

                                //       // if (double.parse(value) >
                                //       //     creditcon.creditapi) {
                                //       //   return "จำนวนเครดิตเกินกำหนด";
                                //       // }
                                //       return null;
                                //     } catch (e) {
                                //       return null;
                                //     }
                                //   },
                                //   onChanged: ((value) {
                                //     creditAmountController.text = value;
                                //     // creditcon.money.value = double.tryParse(
                                //     //         creditAmountController.text
                                //     //             .replaceAll(",", "")) ??
                                //     //     0;
                                //     // creditcon.update();
                                //   }),
                                //   autovalidateMode: AutovalidateMode.always,
                                //   textAlign: TextAlign.left,
                                //   keyboardType:
                                //       const TextInputType.numberWithOptions(
                                //     signed: true,
                                //     decimal: true,
                                //   ),
                                //   decoration: txtFieldDecoration.copyWith(
                                //     hintText: 'ใส่จำนวนเงิน',
                                //   ),
                                //   inputFormatters: <TextInputFormatter>[
                                //     DecimalFormatter()
                                //   ],
                                //   onFieldSubmitted: (value) {
                                //     double input = stringToDouble(
                                //         creditAmountController.text);
                                //     // input > creditcon.creditapi
                                //     //     ? creditAmountController.text = ""
                                //     //     : null;
                                //   },
                                // ),
                                // ),
                                // Padding(
                                //   padding: EdgeInsets.only(
                                //       top: 0.05.sw, bottom: 0.02.sw),
                                //   child: Text(
                                //     'เหตุผลที่ขอเครดิตเพิ่ม',
                                //     style: TextStyle(
                                //       color: const Color(0xFF515151),
                                //       fontSize: 11.sp,
                                //       fontWeight: FontWeight.w400,
                                //     ),
                                //   ),
                                // ),
                                // // DropdownButtonFormField(
                                // //   validator: (value) {
                                // //     if (value == null || value.isEmpty) {
                                // //       return 'กรุณาระบุเหตุผล';
                                // //     }
                                // //     return null;
                                // //   },
                                // //   items: creditcon.reason.map((value) {
                                // //     return DropdownMenuItem<String>(
                                // //       value: value,
                                // //       child: Text(value),
                                // //     );
                                // //   }).toList(),
                                // //   onChanged: (String? value) {
                                // //     setState(() {
                                // //       reasonSelected = value ?? '';
                                // //     });
                                // //   },
                                // //   decoration: txtFieldDecoration.copyWith(
                                // //     hintText: 'ระบุเหตุผล',
                                // //   ),
                                // // ),
                                // Padding(
                                //   padding: EdgeInsets.only(
                                //       top: 0.05.sw, bottom: 0.02.sw),
                                //   child: Text(
                                //     'เหตุผลอื่นๆ',
                                //     style: TextStyle(
                                //       color: const Color(0xFF515151),
                                //       fontSize: 11.sp,
                                //       fontWeight: FontWeight.w400,
                                //     ),
                                //   ),
                                // ),
                                // Focus(
                                //   onFocusChange: (value) {
                                //     // if (value) {
                                //     //   creditcon.isAvaButton.value = false;
                                //     // } else {
                                //     //   creditcon.isAvaButton.value = true;
                                //     // }
                                //   },
                                //   child: TextFormField(
                                //     focusNode: focusNode,
                                //     controller: otherReasonController,
                                //     maxLines: 4,
                                //     onChanged: ((value) {
                                //       // creditcon.firstreason.value =
                                //       //     reasonSelected;
                                //       // otherReasonController.text = value;
                                //       // creditcon.secreason.value =
                                //       //     otherReasonController.text;
                                //       // creditcon.update();
                                //     }),
                                //     style: TextStyle(
                                //       color: Colors.black,
                                //       fontWeight: FontWeight.w400,
                                //       fontSize: 14.sp,
                                //     ),
                                //     decoration: txtFieldDecoration.copyWith(
                                //       hintText: 'ระบุเหตุผล',
                                //     ),
                                //   ),
                                // ),
                                // SizedBox(height: 0.04.sw),
                                // Text(
                                //   'เอกสารแนบ(รูปภาพ)',
                                //   style: TextStyle(
                                //     color: const Color(0xFF515151),
                                //     fontSize: 11.sp,
                                //     fontWeight: FontWeight.w400,
                                //   ),
                                // ),
                                // SizedBox(height: 0.02.sw),
                                // // TripPlanImageForm(
                                // //   maximumImages: 5,
                                // //   onValueChanged: (value) =>
                                // //       images.value = value,
                                // // )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      left: 0.04.sw,
                      right: 0.04.sw,
                      top: 0.04.sw,
                      bottom: 0.12.sw,
                    ),
                    child: Obx(() => SButton.primary(
                          onPressed: c.isEnableSubmit.value
                              ? () async {
                                  // Handle submit
                                  try {
                                    await c.confirmRedeem();
                                    _showSuccessDialog(
                                        context,
                                        "ส่งคำขอแลกแต้มแล้ว",
                                        "กรุณารอเจ้าหน้าที่ยืนยันการแลกแต้ม");
                                  } catch (e) {
                                    _showErrorDialog(
                                        context, "ไม่สามารถแลกแต้มได้");
                                  }
                                }
                              : null, // This disables the button when false
                          text: 'ยืนยันการแลกของรางวัล',
                        )))
              ],
            ),
          ),
        ));
  }

  double stringToDouble(String inputString) {
    String cleanedString = inputString.replaceAll(',', '');

    try {
      double parsedValue = double.parse(cleanedString);

      return parsedValue;
    } catch (e) {
      return 0.00;
    }
  }

  bool isDouble(String value) {
    try {
      double.parse(value);
      return true;
    } catch (e) {
      return false;
    }
  }
}

class DecimalFormatter extends TextInputFormatter {
  final int decimalDigits;

  DecimalFormatter({this.decimalDigits = 2}) : assert(decimalDigits >= 0);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText;

    if (decimalDigits == 0) {
      newText = newValue.text.replaceAll(RegExp('[^0-9]'), '');
    } else {
      newText = newValue.text.replaceAll(RegExp('[^0-9\.]'), '');
    }

    if (newText.contains('.')) {
      if (newText.trim() == '.') {
        return newValue.copyWith(
          text: '0.',
          selection: TextSelection.collapsed(offset: 2),
        );
      } else if ((newText.split(".").length > 2) ||
          (newText.split(".")[1].length > this.decimalDigits)) {
        return oldValue;
      } else
        return newValue;
    }

    if (newText.trim() == '' || newText.trim() == '0') {
      return newValue.copyWith(text: '');
    } else if (int.parse(newText) < 1) {
      return newValue.copyWith(text: '');
    }

    double newDouble = double.parse(newText);
    var selectionIndexFromTheRight =
        newValue.text.length - newValue.selection.end;

    String newString = NumberFormat("#,##0.##").format(newDouble);

    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(
        offset: newString.length - selectionIndexFromTheRight,
      ),
    );
  }
}

class RedeemPromoDropdown extends StatelessWidget {
  final List promolist;
  final RxInt selectedRedeemId =
      0.obs; // You can move this to controller if needed
  final PointSelectController c = Get.find<PointSelectController>();

  RedeemPromoDropdown({required this.promolist});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final List result = promolist ?? [];

      return Column(
        children: [
          DropdownButtonFormField<int>(
            value: selectedRedeemId.value == 0 ? null : selectedRedeemId.value,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              // labelText: "เลือกโปรโมชั่น",
              labelStyle: TextStyle(fontFamily: 'Kanit'),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            items: result.map<DropdownMenuItem<int>>((item) {
              return DropdownMenuItem<int>(
                value: item['redeemtypeId'],
                child: Text(
                  item['redeemtype_name'] ?? '',
                  style: TextStyle(fontFamily: 'Kanit', color: Colors.black),
                ),
              );
            }).toList(),
            onChanged: (int? value) {
              if (value != null) {
                selectedRedeemId.value = value;
                c.isEnableSubmit.value = true;
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "แต้มที่ใช้",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Kanit',
                ),
              ),
              Obx(() {
                final promoList = promolist ?? [];

                final selectedItem = (promoList as List).firstWhere(
                  (item) => item['redeemtypeId'] == selectedRedeemId.value,
                  orElse: () => null,
                );

                c.pointredeem.value = selectedItem?['redeemtype_point'] ?? 0;
                c.redeemtypeId.value = selectedItem?['redeemtypeId'] ?? 0;
                return Text(
                  "${selectedItem?['redeemtype_point'] ?? '- '} แต้ม",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Kanit',
                  ),
                );
              })
            ],
          )
        ],
      );
    });
  }
}

void _showSuccessDialog(BuildContext context, String message, String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // Start a timer to auto-dismiss the dialog
      Timer(Duration(seconds: 3), () {
        Navigator.of(context).pop();
      });

      return SuccessDialogWidget(
        submitText: "",
        submitButton: false,
        title: message,
        content: content,
      );
    },
  );
}

void _showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ErrorDialogWidget(
        title: "Error",
        content: message,
        onSubmit: () => Navigator.of(context).pop(),
      );
    },
  );
}
