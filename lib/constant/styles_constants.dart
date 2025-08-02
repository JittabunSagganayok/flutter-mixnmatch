// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final maxHeightContain = BoxConstraints(
  maxHeight: double.infinity,
);

final bgAlert = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(27),
);

final bgAlertBottom = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.vertical(
    top: Radius.circular(30),
  ),
);

final bgCLD = BoxDecoration(
  borderRadius: BorderRadius.circular(14),
  color: Colors.white,
  border: Border.all(
    color: const Color(0xFFD2D2D2),
    width: 1,
  ),
);

final buttonWhite =
    BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white);

final buttonRed = BoxDecoration(
    borderRadius: BorderRadius.circular(16), color: const Color(0xFFC42A27));

final buttonBlue = BoxDecoration(
    borderRadius: BorderRadius.circular(24), color: const Color(0xFF325FA4));

final buttonBlueAlert = BoxDecoration(
    borderRadius: BorderRadius.circular(16), color: const Color(0xFF325FA4));

final buttonWhiteBAlert = BoxDecoration(
  borderRadius: BorderRadius.circular(16),
  color: Colors.white,
  border: Border.all(
    color: const Color(0xFF325FA4),
    width: 1,
  ),
);
final buttonWhiteRedBAlert = BoxDecoration(
  borderRadius: BorderRadius.circular(16),
  color: Colors.white,
  border: Border.all(
    color: const Color(0xFFC42A27),
    width: 1,
  ),
);
final buttonRedCancel = BoxDecoration(
  borderRadius: BorderRadius.circular(16),
  color: Color(0xffC42A27),
  border: Border.all(
    color: const Color(0xFFC42A27),
    width: 1,
  ),
);

final buttonYellowBAlert = BoxDecoration(
  borderRadius: BorderRadius.circular(16),
  color: Colors.white,
  border: Border.all(
    color: const Color(0xFFF19E3A),
    width: 1,
  ),
);

final buttonRedBAlert = BoxDecoration(
  borderRadius: BorderRadius.circular(16),
  color: Colors.white,
  border: Border.all(
    color: const Color(0xFFC42A27),
    width: 1,
  ),
);

final buttonStock = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: Color(0xFfF7FBFF),
  border: Border.all(
    color: const Color(0xFF9BBCD9),
    width: 1,
  ),
);

final buttonWhiteB = BoxDecoration(
  borderRadius: BorderRadius.circular(12),
  color: Colors.white,
  border: Border.all(
    color: const Color(0xFF325FA4),
    width: 1,
  ),
);

final txtFieldB = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    borderSide: BorderSide(color: Color(0xFF325FA4)));

final txtFieldT = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    borderSide: BorderSide(color: Color(0xFF9BBCD9)));

final txtFieldF = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    borderSide: BorderSide(color: Colors.transparent));

final txtFieldE = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    borderSide: BorderSide(color: Color(0xFFC42A27)));

final txtFieldTAlert = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(color: Color(0xFF9BBCD9)));

final txtFieldFAlert = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(color: Colors.transparent));

final txtFieldSumP = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(color: Colors.transparent));

final txtFieldAmout = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(color: Color(0xFF325FA4)));

final tabD = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(
      Radius.circular(30),
    ),
    border: Border.all(
      color: const Color(0xFFAFAFAF),
      width: 1,
    ));

final tabSelect = BoxDecoration(
  color: const Color(0xFF325FA4),
  borderRadius: const BorderRadius.all(
    Radius.circular(30),
  ),
);

final tab6Select = BoxDecoration(
  color: const Color(0xFF325FA4),
  borderRadius: const BorderRadius.all(
    Radius.circular(6),
  ),
);

final tabUnSelect = BoxDecoration(
  color: Colors.white,
  borderRadius: const BorderRadius.all(
    Radius.circular(30),
  ),
);

final tab6UnSelect = BoxDecoration(
  color: Color(0xffEDEDED),
  borderRadius: const BorderRadius.all(
    Radius.circular(6),
  ),
);

final loadD = BoxDecoration(
    borderRadius: BorderRadius.circular(16), color: const Color(0xFFF1F1F1));

final txtFieldSearch = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
    borderSide: BorderSide(color: Colors.white));

final bestSellerD = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: Colors.white,
  boxShadow: const [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.08),
      offset: Offset(0, 3),
      blurRadius: 10.0,
      spreadRadius: 0,
    )
  ],
);

final interesD = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(
    Radius.circular(15),
  ),
  boxShadow: const [
    BoxShadow(
      color: Color.fromARGB(61, 128, 128, 128),
      blurRadius: 10.0,
      spreadRadius: 0,
    )
  ],
);

final bgButtonB = BoxDecoration(
  color: Colors.white,
  border: Border(
    top: BorderSide(width: 1, color: Color(0xFFDCDCDC)),
  ),
);

final bgPromoD = BoxDecoration(
  color: Color(0xFFFFEEEA),
  borderRadius: BorderRadius.all(
    Radius.circular(5),
  ),
);

final bgWD = BoxDecoration(
  color: Color(0xFFFFF4D7),
  borderRadius: BorderRadius.all(
    Radius.circular(5),
  ),
);

final bgISD = BoxDecoration(
  color: Color(0xFFE9FFE9),
  borderRadius: BorderRadius.all(
    Radius.circular(5),
  ),
);

final bgBlueLD = BoxDecoration(
  color: const Color(0xFFE6F0FF),
  borderRadius: BorderRadius.circular(12),
);

final bgTypeD = BoxDecoration(
  color: const Color(0xFFF6F7FA),
  borderRadius: BorderRadius.circular(12),
);

final checkBoxUnS = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  color: Colors.white,
  border: Border.all(
    color: const Color(0xFF9B9B9B),
    width: 1,
  ),
);

final checkBoxUS = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  color: const Color(0xFFF4F4F4),
  border: Border.all(
    color: const Color(0xFF9B9B9B),
    width: 1,
  ),
);

final checkBoxS = BoxDecoration(
  borderRadius: BorderRadius.circular(5),
  color: const Color(0xFF145C99),
  border: Border.all(
    color: const Color(0xFF145C99),
    width: 1,
  ),
);

final unUseCoupon = BoxDecoration(
  borderRadius: BorderRadius.circular(16),
  color: Colors.white,
  border: Border.all(
    color: const Color(0xFF325FA4),
    width: 1,
  ),
);

final useCoupon = BoxDecoration(
  borderRadius: BorderRadius.circular(16),
  color: const Color(0xFF325FA4),
  border: Border.all(
    color: const Color(0xFF325FA4),
    width: 1,
  ),
);

final bgContainerS = BoxDecoration(
  borderRadius: BorderRadius.circular(16),
  color: Colors.white,
  boxShadow: const [
    BoxShadow(
      color: Color.fromARGB(39, 128, 128, 128),
      blurRadius: 10.0,
      spreadRadius: 0,
    )
  ],
);
final bgContainerNotReadNotification = BoxDecoration(
  borderRadius: BorderRadius.circular(16),
  color: const Color(0xFFE7F0FF),
  boxShadow: const [
    BoxShadow(
      color: Color.fromARGB(39, 128, 128, 128),
      blurRadius: 10.0,
      spreadRadius: 0,
    )
  ],
);
final addressS = BoxDecoration(
    color: const Color(0xFFE6F0FF),
    borderRadius: const BorderRadius.all(
      Radius.circular(8),
    ),
    border: Border.all(
      color: const Color(0xFFE6F0FF),
      width: 1,
    ));

final addressU = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(
      Radius.circular(8),
    ),
    border: Border.all(
      color: const Color(0xFFEBEBEB),
      width: 1,
    ));

final addressCS = BoxDecoration(
  color: const Color(0xFF325FA4),
  borderRadius: const BorderRadius.all(
    Radius.circular(5),
  ),
  // border: Border.all(
  //   color: const Color(0xFFAFAFAF),
  //   width: 1,
  // )
);

final addressCU = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(
      Radius.circular(5),
    ),
    border: Border.all(
      color: Colors.black,
      width: 1,
    ));

final profileD = BoxDecoration(
  borderRadius: BorderRadius.circular(18),
  color: Colors.white,
  boxShadow: const [
    BoxShadow(
        color: Color.fromARGB(39, 128, 128, 128),
        blurRadius: 15.0,
        offset: Offset(0.0, 0.75))
  ],
);

final appbarBorder = RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(
    bottom: Radius.circular(16),
  ),
);

final txtFieldMaxL = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    borderSide: BorderSide(
      color: Color(0xFFF6F7FA),
    ));

final txtFieldErrorMaxL = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    borderSide: BorderSide(
      color: Color(0xFFFF0000),
    ));

final txtFieldDecoration = InputDecoration(
  counterText: '',
  hintText: '',
  fillColor: const Color(0xFFF6F7FA),
  filled: true,
  hintStyle: TextStyle(
    color: const Color(0xFFA8A8A8),
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
  ),
  contentPadding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.04.sw),
  enabledBorder: txtFieldMaxL,
  focusedBorder: txtFieldMaxL,
  errorBorder: txtFieldErrorMaxL,
  focusedErrorBorder: txtFieldErrorMaxL,
  errorStyle: const TextStyle(color: Color(0xFFFF0000)),
);

final buttonPD = BoxDecoration(
    borderRadius: BorderRadius.circular(11), color: const Color(0xFFE6F0FF));

final buttonHD = BoxDecoration(
    borderRadius: BorderRadius.circular(11), color: const Color(0xFFFFECD7));

final buttonCD = BoxDecoration(
    borderRadius: BorderRadius.circular(11), color: const Color(0xFFFFE0E0));

final buttonSD = BoxDecoration(
    borderRadius: BorderRadius.circular(11), color: const Color(0xFFECFAE4));

final bgTabOrder = BoxDecoration(
  color: Colors.white,
  boxShadow: const [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.08),
      offset: Offset(0, 3),
      blurRadius: 10.0,
      spreadRadius: 0,
    )
  ],
);

final tabOrderS = BoxDecoration(
    color: const Color(0xFF325FA4),
    borderRadius: const BorderRadius.all(
      Radius.circular(8),
    ),
    border: Border.all(
      color: const Color(0xFF325FA4),
      width: 1,
    ));

final tabOrderU = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(
      Radius.circular(8),
    ),
    border: Border.all(
      color: const Color(0xFF325FA4),
      width: 1,
    ));

final billB = BoxDecoration(
  color: Colors.white,
  borderRadius: const BorderRadius.all(
    Radius.circular(22),
  ),
  border: Border.all(
    color: const Color(0xFF325FA4),
    width: 1,
  ),
  boxShadow: const [
    BoxShadow(
      color: Color.fromRGBO(130, 169, 188, 0.18),
      blurRadius: 3.0,
      spreadRadius: 2,
    )
  ],
);

final billG = BoxDecoration(
  color: Colors.white,
  borderRadius: const BorderRadius.all(
    Radius.circular(13),
  ),
  border: Border.all(
    color: const Color(0xFF449C43),
    width: 1,
  ),
  boxShadow: const [
    BoxShadow(
      color: Color.fromRGBO(130, 169, 188, 0.18),
      blurRadius: 3.0,
      spreadRadius: 2,
    )
  ],
);

final billR = BoxDecoration(
  color: Colors.white,
  borderRadius: const BorderRadius.all(
    Radius.circular(13),
  ),
  border: Border.all(
    color: const Color(0xFFC42A27),
    width: 1,
  ),
  boxShadow: const [
    BoxShadow(
      color: Color.fromRGBO(130, 169, 188, 0.18),
      blurRadius: 3.0,
      spreadRadius: 2,
    )
  ],
);

final paymentS = BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    color: const Color(0xFFE6F0FF),
    border: Border.all(
      color: const Color(0xFFE6F0FF),
      width: 1,
    ));

final paymentU = BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    color: const Color(0xFFFAFAFA),
    border: Border.all(
      color: const Color(0xFFF1F1F1),
      width: 1,
    ));

final addButton = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10),
  border: Border.all(
    color: const Color(0xFFEBEBEB),
    width: 1,
  ),
);

final bgPayD = BoxDecoration(
  borderRadius: BorderRadius.circular(16),
  color: Colors.white,
  boxShadow: const [
    BoxShadow(
      color: Color.fromARGB(74, 128, 128, 128),
      offset: Offset(0, 3),
      blurRadius: 7.0,
      spreadRadius: 0,
    )
  ],
);

final infoPN = BoxDecoration(
  borderRadius: BorderRadius.circular(20),
  color: const Color(0xFFE6F0FF),
  boxShadow: const [
    BoxShadow(
      color: Color.fromARGB(38, 128, 128, 128),
      offset: Offset(0, 3),
      blurRadius: 9.0,
      spreadRadius: 1,
    )
  ],
);

final appointB = BoxDecoration(
  borderRadius: BorderRadius.vertical(
    bottom: Radius.circular(16),
  ),
  color: const Color(0xFFE6F0FF),
);

final inputT = BoxDecoration(
  color: const Color(0xFFF7FBFF),
  borderRadius: BorderRadius.circular(16),
  border: Border.all(
    color: const Color(0xFF9BBCD9),
    width: 1,
  ),
);

final inputF = BoxDecoration(
  color: const Color(0xFFF6F7FA),
  borderRadius: BorderRadius.circular(16),
);

final tabCSelect = BoxDecoration(
  color: const Color(0xFF325FA4),
  borderRadius: const BorderRadius.all(
    Radius.circular(30),
  ),
);

final tabCUnSelect = BoxDecoration(
  color: Color(0xFFFAFAFA),
  borderRadius: const BorderRadius.all(
    Radius.circular(30),
  ),
);

final contactB = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(16),
  border: Border.all(
    color: const Color(0xFF9BBCD9),
    width: 1,
  ),
);

final bgCD = BoxDecoration(
  borderRadius: BorderRadius.circular(16),
  color: Colors.white,
  boxShadow: const [
    BoxShadow(
      color: Color.fromRGBO(130, 169, 188, 0.18),
      offset: Offset(0, 3),
      blurRadius: 8.0,
      spreadRadius: 0,
    )
  ],
);

final bgH1 = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/images/bg1.png'),
    fit: BoxFit.fill,
  ),
  boxShadow: const [
    BoxShadow(
      color: Color.fromRGBO(130, 169, 188, 0.18),
      offset: Offset(0, 3),
      blurRadius: 8.0,
      spreadRadius: 0,
    )
  ],
);

final bgH2 = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/images/bg2.png'),
    fit: BoxFit.fill,
  ),
  boxShadow: const [
    BoxShadow(
      color: Color.fromRGBO(130, 169, 188, 0.18),
      offset: Offset(0, 3),
      blurRadius: 8.0,
      spreadRadius: 0,
    )
  ],
);

final bgH3 = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/images/bg3.png'),
    fit: BoxFit.fill,
  ),
  boxShadow: const [
    BoxShadow(
      color: Color.fromRGBO(130, 169, 188, 0.18),
      offset: Offset(0, 3),
      blurRadius: 8.0,
      spreadRadius: 0,
    )
  ],
);

final contactC = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(
      Radius.circular(16),
    ),
    border: Border.all(
      color: const Color(0xFFAFAFAF),
      width: 1,
    ));

final bgP = BoxDecoration(
  borderRadius: BorderRadius.circular(16),
  color: const Color(0xFFF7F8FF),
  boxShadow: const [
    BoxShadow(
      color: Color.fromRGBO(130, 169, 188, 0.18),
      offset: Offset(0, 5),
      blurRadius: 6.0,
      spreadRadius: 0,
    )
  ],
);

final bgTpH = BoxDecoration(
  color: Colors.white,
  boxShadow: const [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.04),
      offset: Offset(0, 4),
      blurRadius: 6.0,
      spreadRadius: 0,
    )
  ],
);

final noti = BoxDecoration(
  color: const Color(0xFFC42A27),
  borderRadius: BorderRadius.circular(9),
);

final notiC = BoxConstraints(
  minWidth: 17,
  minHeight: 10,
);

final tpTabS = BoxDecoration(
  color: const Color(0xFF325FA4),
  borderRadius: const BorderRadius.all(
    Radius.circular(30),
  ),
  boxShadow: const [
    BoxShadow(
      color: Color.fromRGBO(130, 169, 188, 0.18),
      offset: Offset(0, 6),
      blurRadius: 8.0,
      spreadRadius: 0,
    )
  ],
);

final tpShadow = BoxShadow(
  color: Color.fromRGBO(130, 169, 188, 0.18),
  offset: Offset(0, 6),
  blurRadius: 8.0,
  spreadRadius: 0,
);
