import 'package:flutter/material.dart';
class CustomToggleTheme extends StatefulWidget {
  const CustomToggleTheme({super.key});

  @override
  State<CustomToggleTheme> createState() => _CustomToggleThemeState();
}

class _CustomToggleThemeState extends State<CustomToggleTheme> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2), // الخلفية الرمادية الأساسية
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          // النص والأيقونة للوضع غير المختار داخل الحاوية الرمادية
          Row(
            mainAxisAlignment: isDarkMode ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: Row(
                  children: [
                    Icon(
                      isDarkMode
                          ? Icons.wb_sunny_outlined
                          : Icons.nightlight_round,
                      size: 20,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 8),
                    Text(
                      isDarkMode ? "Light" : "Dark",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // الجزء المتحرك الذي يعبر عن الوضع الحالي
          AnimatedAlign(
            duration: Duration(milliseconds: 300),
            alignment: isDarkMode ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              width: 100,
              height: 34,
              decoration: BoxDecoration(
                color: Colors.white, // اللون الأبيض للوضع المختار
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isDarkMode
                        ? Icons.nightlight_round
                        : Icons.wb_sunny_outlined,
                    size: 20,
                    color: Colors.black,
                  ),
                  SizedBox(width: 4),
                  Text(
                    isDarkMode ? "Dark" : "Light",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // منطقة التفاعل
          GestureDetector(
            onTap: () {
              setState(() {
                isDarkMode = !isDarkMode; // التبديل بين الوضعين
              });
            },
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
