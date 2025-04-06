import 'package:flutter/material.dart';

void main() {
  runApp(const WhatsApp());
}

class WhatsApp extends StatelessWidget {
  const WhatsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CacOffical());
  }
}

class CacOffical extends StatelessWidget {
  const CacOffical({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the theme colors from the current theme
    // final primaryColor = Theme.of(context).primaryColor;
    // final textColor =
    // Theme.of(context).appBarTheme.titleTextStyle?.color ?? Colors.white;

    return SafeArea(
      child: Scaffold(
        body: Padding(padding: EdgeInsets.all(20), child: SizedBox()),
      ),
    );
  }
  //
  // Helper method to build menu containers
  //   Widget _buildMenuContainer(
  //     BuildContext context,
//     IconData icon,
//     String label,
//   ) {
  //     return Container(
  //       width: MediaQuery.of(context).size.width / 3 - 20,
  //       height: MediaQuery.of(context).size.width / 3 - 20,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         // color: primaryColor,
  //       ),
  //       child: Center(
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             IconButton(
  //               onPressed: null,
  //               icon: Icon(
  //                 icon,
  //                 // color: textColor,
  //                 size: 30,
  //               ),
  //             ),
  //             Text(
  //               label,
  //               style: TextStyle(
  //                 // color: textColor, /// Testing Everything!"Note
  //                 // fontSize: 20,
  //                 // fontWeight: FontWeight.bold,"
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  //   }

}

/**
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 *  
 * 
 * 
 * 
 * 
 */

// final ThemeData doctorAppTheme = ThemeData(
//   colorScheme: ColorScheme(
//     primary: Color(0xFF2196F3),
//     primaryContainer: Color(0xFF1976D2),
//     secondary: Color(0xFF03A9F4),
//     secondaryContainer: Color(0xFF0288D1),
//     surface: Color(0xFFF5F5F5),
//     onPrimary: Color(0xFFFFFFFF),
//     onSecondary: Color(0xFFFFFFFF),
//     onSurface: Color(0xFF000000),
//     error: Color(0xFFD32F2F),
//     onError: Color(0xFFFFFFFF),
//     brightness: Brightness.light,
//   ),
//   appBarTheme: AppBarTheme(
//     backgroundColor: Color(0xFF2196F3),
//     titleTextStyle: TextStyle(
//       color: Colors.white,
//       fontSize: 20,
//       fontWeight: FontWeight.bold,
//     ),
//     iconTheme: IconThemeData(color: Colors.white),
//   ),
//   buttonTheme: ButtonThemeData(
//     buttonColor: Color(0xFF03A9F4),
//     textTheme: ButtonTextTheme.primary,
//   ),
//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: Color(0xFF03A9F4),
//       foregroundColor: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//     ),
//   ),
//   cardTheme: CardTheme(
//     color: Colors.white,
//     shadowColor: Colors.grey.shade300,
//     elevation: 4,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//   ),
//   // containerTheme: ContainerThemeData(
//   //   decoration: BoxDecoration(
//   //     color: Colors.white,
//   //     borderRadius: BorderRadius.circular(12),
//   //     boxShadow: [
//   //       BoxShadow(color: Colors.grey.shade300, blurRadius: 4, spreadRadius: 2),
//   //     ],
//   //   ),
//   // ),
//   textTheme: TextTheme(
//     bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
//     bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),
//     titleLarge: TextStyle(
//       fontSize: 22,
//       fontWeight: FontWeight.bold,
//       color: Colors.black,
//     ),
//   ),
//   inputDecorationTheme: InputDecorationTheme(
//     filled: true,
//     fillColor: Colors.white,
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(8),
//       borderSide: BorderSide(color: Colors.grey.shade300),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(8),
//       borderSide: BorderSide(color: Color(0xFF2196F3)),
//     ),
//   ),
//   dividerTheme: DividerThemeData(color: Colors.grey.shade400, thickness: 1),
//   snackBarTheme: SnackBarThemeData(
//     backgroundColor: Color(0xFF2196F3),
//     contentTextStyle: TextStyle(color: Colors.white),
//   ),
//   floatingActionButtonTheme: FloatingActionButtonThemeData(
//     backgroundColor: Color(0xFF03A9F4),
//     foregroundColor: Colors.white,
//   ),
//   chipTheme: ChipThemeData(
//     backgroundColor: Colors.grey.shade200,
//     selectedColor: Color(0xFF03A9F4),
//     labelStyle: TextStyle(color: Colors.black),
//   ),
//   switchTheme: SwitchThemeData(
//     thumbColor: WidgetStateProperty.all(Color(0xFF03A9F4)),
//     trackColor: WidgetStateProperty.all(Color(0xFFB3E5FC)),
//   ),
//   progressIndicatorTheme: ProgressIndicatorThemeData(color: Color(0xFF03A9F4)),
//   popupMenuTheme: PopupMenuThemeData(
//     color: Colors.white,
//     textStyle: TextStyle(color: Colors.black),
//   ),
//   checkboxTheme: CheckboxThemeData(
//     checkColor: WidgetStateProperty.all(Colors.white),
//     fillColor: WidgetStateProperty.all(Color(0xFF03A9F4)),
//   ),
//   sliderTheme: SliderThemeData(
//     activeTrackColor: Color(0xFF03A9F4),
//     thumbColor: Color(0xFF03A9F4),
//   ),
//   tooltipTheme: TooltipThemeData(
//     decoration: BoxDecoration(
//       color: Color(0xFF03A9F4),
//       borderRadius: BorderRadius.circular(4),
//     ),
//     textStyle: TextStyle(color: Colors.white),
//   ),
//   tabBarTheme: TabBarTheme(
//     labelColor: Color(0xFF03A9F4),
//     unselectedLabelColor: Colors.grey,
//   ),
//   navigationBarTheme: NavigationBarThemeData(
//     backgroundColor: Colors.white,
//     indicatorColor: Color(0xFF03A9F4),
//   ),
//   bottomSheetTheme: BottomSheetThemeData(
//     backgroundColor: Colors.white,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//     ),
//   ),
//   radioTheme: RadioThemeData(
//     fillColor: WidgetStateProperty.all(Color(0xFF03A9F4)),
//   ),
//   expansionTileTheme: ExpansionTileThemeData(
//     backgroundColor: Colors.white,
//     collapsedBackgroundColor: Colors.grey.shade200,
//     iconColor: Color(0xFF03A9F4),
//   ),
//   scrollbarTheme: ScrollbarThemeData(
//     thumbColor: WidgetStateProperty.all(Color(0xFF03A9F4)),
//   ),
//   bannerTheme: MaterialBannerThemeData(
//     backgroundColor: Colors.white,
//     contentTextStyle: TextStyle(color: Colors.black),
//   ),
//   datePickerTheme: DatePickerThemeData(
//     backgroundColor: Colors.white,
//     headerBackgroundColor: Color(0xFF03A9F4),
//     headerForegroundColor: Colors.white,
//   ),
//   timePickerTheme: TimePickerThemeData(
//     backgroundColor: Colors.white,
//     dialHandColor: Color(0xFF03A9F4),
//     hourMinuteColor: WidgetStateColor.resolveWith(
//       (states) => Color(0xFF03A9F4),
//     ),
//   ),
// );
