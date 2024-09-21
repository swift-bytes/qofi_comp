import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'hex_color.dart';
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

TextStyle homeHeadingStyle(context)=> TextStyle(
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

Radius messageRadius = Radius.circular(20.sp);

extension CapitalizeFirst on String {
  String get capitalizeFirst => "${this[0].toUpperCase()}${substring(1)}";
  String get capitalizeAll =>
      split(" ").map((e) => e.capitalizeFirst).join(" ");
}


getStatusColor(String? status, BuildContext context) {
  switch (status) {
    case "requested":
    case "active":
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

Color primaryColor = HexColor("#DA2F46");

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      shadowColor: Colors.grey.withOpacity(0.15),
      highlightColor: Colors.grey,
      primaryColor: primaryColor,
      fontFamily: "Figtree",
      dividerColor: Colors.grey[800],
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          color: Colors.white,
        ),
      ),
      primarySwatch: MaterialColor(primaryColor.value, <int, Color>{
        50: primaryColor,
        100: primaryColor,
        200: primaryColor,
        300: primaryColor,
        400: primaryColor,
        500: primaryColor,
        600: primaryColor,
        700: primaryColor,
        800: primaryColor,
        900: primaryColor,
      }),
      disabledColor: Colors.grey.withOpacity(0.6),
      canvasColor: Colors.white,
      hoverColor: HexColor("#cdfacf"),
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        shadow: Colors.grey.withOpacity(0.15),
        background: HexColor("#1a1a1a"),
        brightness: Brightness.light,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        foregroundColor: HexColor("#1a1a1a"),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 14.ft,
        ),
      ),
      cardColor: Colors.black,
      scaffoldBackgroundColor: HexColor("#1a1a1a"),
    );
ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      highlightColor: Colors.grey[600],
      shadowColor: Colors.grey.withOpacity(0.15),
      primaryColor: primaryColor, // Change the primary color here
      fontFamily: "Rubik",
      primarySwatch: MaterialColor(primaryColor.value, <int, Color>{
        50: primaryColor,
        100: primaryColor,
        200: primaryColor,
        300: primaryColor,
        400: primaryColor,
        500: primaryColor,
        600: primaryColor,
        700: primaryColor,
        800: primaryColor,
        900: primaryColor,
      }),
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.light,
          background: Colors.white,
          error: HexColor("#FF0000")),
      cardColor: Colors.white,
      canvasColor: HexColor("#1a1a1a"),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: HexColor("#1a1a1a"),
        ),
        bodyMedium: TextStyle(
          color: HexColor("#1a1a1a"),
        ),
      ),
      hoverColor: HexColor("#cdfacf"),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        isDense: true,
        hintStyle: TextStyle(
          color: HexColor("#f0f2f5"),
          fontSize: 13.ft,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 0.6.h,
        ),
        enabledBorder: homeTextFieldBorder.copyWith(
          borderRadius: BorderRadius.zero,
        ),
        focusedBorder: homeTextFieldBorder.copyWith(
          borderRadius: BorderRadius.zero,
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: HexColor("#F1F4F9"),
        scrolledUnderElevation: 0,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontFamily: "Figtree",
          color: Colors.black,
          fontSize: 14.ft,
        ),
      ),
      dividerColor: HexColor("#F2F2F2"),
      
      scaffoldBackgroundColor: HexColor('#F1F4F9'),
    );
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
