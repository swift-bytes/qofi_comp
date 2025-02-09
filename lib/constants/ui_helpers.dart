import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'hex_color.dart';
import 'package:intl/intl.dart';

extension StringExtension on dynamic {
  String trs(BuildContext context) {
    if (toString().isEmpty) {
      return this;
    }
    return contains("@") || contains("http")
        ? this
        : (this[0].toUpperCase() + substring(1)).replaceAll("_", " ");
  }
}

bool get isTablet {
  final firstView = WidgetsBinding.instance.platformDispatcher.views.first;
  final logicalShortestSide =
      firstView.physicalSize.shortestSide / firstView.devicePixelRatio;
  return logicalShortestSide > 600;
}

font(num font) {
  return isTablet ? (font * 0.9).sp : (font * 1.1).sp;
}

// String formatCurrency(num? val, {String? locale, String? symbol}) {
//   return NumberFormat.currency(
//     locale: locale ?? 'en_US',
//     symbol: symbol ?? 'Rs. ',
//     decimalDigits: 0,
//   ).format(val ?? "0");
// }

TextStyle homeHeadingStyle(context) => TextStyle(
      fontSize: 17.ft,
      color: Theme.of(context).canvasColor,
      fontWeight: FontWeight.w600,
    );

extension Font on num {
  double get ft => font(this);
}

extension Weight on int {
  FontWeight get wt => getFontWeight(this);
}

getFontWeight(int weight) {
  switch (weight) {
    case 400:
      return FontWeight.w400;
    case 500:
      return FontWeight.w500;
    case 600:
      return FontWeight.w600;
    case 700:
      return FontWeight.bold;
    case 800:
      return FontWeight.w800;
    default:
      return FontWeight.normal;
  }
}

List<BoxShadow> boxShadow(double spread, {Color? color}) => [
      BoxShadow(
          color: color ?? Colors.grey.withOpacity(0.15),
          spreadRadius: spread,
          blurRadius: 12)
    ];

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

var homeTextFieldBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.sp),
    borderSide: BorderSide(color: Colors.transparent));
double calculateMarkerSize(double zoom) {
  if (zoom <= 10) {
    return 1.5.h;
  } else if (zoom <= 15) {
    return 2.h;
  } else {
    return 3.h;
  }
}

getLuggageStringFromNumber(int? luggage) {
  switch (luggage) {
    case 0:
      return "None";
    case 1:
      return "1 x Standard";
    case 2:
      return "2 x Standard";
    default:
      return null;
  }
}

getNumberFromLuggageString(String? val) {
  switch (val) {
    case "None":
      return 0;
    case "1 x Standard":
      return 1;
    case "2 x Standard":
      return 2;
    default:
      return null;
  }
}

ButtonStyle iconButtonStyle = TextButton.styleFrom(
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  padding: EdgeInsets.all(1.w),
  minimumSize: Size.zero,
  shape: CircleBorder(),
);
TextStyle verifyIDTextStyle(context) => TextStyle(
    color: Theme.of(context).canvasColor,
    fontSize: 14.ft,
    fontWeight: FontWeight.w500);

String mergeStrings(List strings) {
  List val = strings.join("").split("").toList()..sort();
  return val.join("");
}

formatDateInHours(DateTime? date) {
  final now = DateTime.now();
  final difference = now.difference(date ?? DateTime.now());
  if (difference.inDays > 0) {
    return "${difference.inDays}d ago";
  } else if (difference.inHours > 0) {
    return "${difference.inHours}h ago";
  } else if (difference.inMinutes > 0) {
    return "${difference.inMinutes}m ago";
  } else {
    return "Just now";
  }
}

formatNumber(num? val) {
  return NumberFormat("#,##0").format(val ?? 0);
}

Radius messageRadius = Radius.circular(20.sp);

extension CapitalizeFirst on String {
  String get capitalizeFirst => "${this[0].toUpperCase()}${substring(1)}";
  String get capitalizeAll =>
      split(" ").map((e) => e.capitalizeFirst).join(" ");
  String get mask => maskCardNumber(this);
}

String maskCardNumber(String cardNumber) {
  if (cardNumber.length > 4) {
    String lastFourDigits = cardNumber.substring(cardNumber.length - 4);
    return '**** **** **** $lastFourDigits';
  } else {
    return cardNumber;
  }
}

getStatusColor(String? status, BuildContext context) {
  switch (status) {
    case "requested":
    case "active":
    case "processing":
      return {
        "color": HexColor("faac00"),
        "containerColor": HexColor("faac00").withOpacity(0.2)
      };
    case "accepted":
    case "completed":
      return {
        "color": Theme.of(context).primaryColor,
        "containerColor": Theme.of(context).primaryColor.withOpacity(0.25)
      };
    case "rejected":
      return {
        "color": Theme.of(context).colorScheme.error,
        "containerColor": Theme.of(context).colorScheme.error.withOpacity(0.1)
      };
    case "cancelled":
      return {
        "color": Theme.of(context).highlightColor,
        "containerColor": Theme.of(context).highlightColor.withOpacity(0.1)
      };

    default:
      return {
        "color": Theme.of(context).primaryColor,
        "containerColor": Theme.of(context).cardColor
      };
  }
}

BoxDecoration cardDecor(context, {Color? backgroundColor}) => BoxDecoration(
    color: backgroundColor,
    borderRadius: BorderRadius.circular(13.sp),
    border: Border.all(
      color: Theme.of(context).indicatorColor,
    ));

Map<String, dynamic> tripParamsToPayload(Map<String, dynamic> data) {
  Map<String, dynamic> filters = {};
  filters['filters'] = {
    'price_per_seat': data['min_price'] == null && data['max_price'] == null
        ? null
        : {
            'min': double.tryParse(data['min_price'].toString()),
            'max': double.tryParse(data['max_price'].toString()),
          },
    'available_seats': data['min_seats'] == null && data['max_seats'] == null
        ? null
        : {
            'min': double.tryParse(data['min_seats'].toString()),
            'max': double.tryParse(data['max_seats'].toString()),
          },
    'departure_time': data['start_date'] == null && data['end_date'] == null
        ? null
        : {
            'min': data['start_date'],
            'max': data['end_date'],
          },
    'smokers': data['smokers'],
    'luggage_per_seat': int.tryParse(data['luggage'].toString()),
  };
  filters["sort"] = {"type": data["sort"], "order": data["order"]};
  return filters;
}

SizedBox vertical1_2 = SizedBox(height: 0.5.h);
SizedBox vertical1 = SizedBox(height: 1.h);
SizedBox vertical2 = SizedBox(height: 2.h);
SizedBox vertical3 = SizedBox(height: 3.h);
SizedBox vertical4 = SizedBox(height: 4.h);
SizedBox horizontal1 = SizedBox(width: 1.w);
SizedBox horizontal2 = SizedBox(width: 2.w);
SizedBox horizontal3 = SizedBox(width: 3.w);
SizedBox horizontal4 = SizedBox(width: 4.w);

extension SizerExt on num {
  Widget get high => SizedBox(
        height: h,
      );
  Widget get wide => SizedBox(
        width: w,
      );
}

extension Validator on dynamic {
  bool get isValidEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
        .hasMatch(this.toString());
  }

  bool get isValidPassword {
    return RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$')
        .hasMatch(this.toString());
  }
}

getOrderStatusColor(String? status, BuildContext context) {
  switch (status?.toLowerCase()) {
    case "processing":
      return {
        "color": HexColor("faac00"),
        "containerColor": HexColor("faac00").withOpacity(0.2)
      };
    case "completed":
    case "delivered":
      return {
        "color": HexColor("#0CB44F"),
        "containerColor": HexColor("#0CB44F").withOpacity(0.1)
      };
    default:
      return {
        "color": Theme.of(context).primaryColor,
        "containerColor": Theme.of(context).cardColor
      };
  }
}

extension Snack on String {
  void showSnackBar(Color color, BuildContext context, {EdgeInsets? margin}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      margin: margin,
      behavior: SnackBarBehavior.floating,
      content: Text(
        this,
        maxLines: 3,
      ),
      backgroundColor: color,
    ));
  }
}

extension Format on dynamic {
  String formatCurrency({int decimal = 1,String? currency}) => NumberFormat.currency(
        locale: 'en_US',
        symbol: currency??"",
        decimalDigits: decimal,
      ).format(num.tryParse("${this ?? 0}")??0);
}

priceAfterDiscount(price, Map discount) {
  price = num.parse(price.toString());
  if (discount.isEmpty) {
    return price;
  }
  if (discount['type'] == "percent") {
    return price - (price * discount['amount'] / 100);
  }
  return price - discount['amount'];
}