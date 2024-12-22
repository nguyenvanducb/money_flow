import 'dart:ui';

abstract class AppColors {
  static Color? hexColor(String colorCode) {
    var color = colorCode.toUpperCase().replaceAll("#", "");
    if (color.length == 6) {
      color = "FF$color";
    }
    if (color.length == 8) {
      try {
        return Color(int.parse("0x$color"));
      } catch (_) {}
    }
    return null;
  }
  //   var color = hexColor("#FF5733");
  // print(color); // Output: Color(0xffff5733)

  static const backgroundColor = Color(0Xff2A56B9);
}
