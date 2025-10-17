import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class VerticalScreen extends StatefulWidget {
  const VerticalScreen({super.key});

  @override
  State<VerticalScreen> createState() => _VerticalScreenState();
}

class _VerticalScreenState extends State<VerticalScreen> {
  // Danh sách tiêu đề
  final List<String> titles = const [
    'Disney Zootopia',
    'Monkey D. Luffy',
    'Judy Hopps & Nick Wilde',
    'Minions',
    'Despicable Me',
    'Tom and Jerry',
  ];

  // Danh sách ảnh
  late final List<Widget> images = List.generate(
    titles.length,
    (index) => ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'assets/images/photo00${index + 1}.png',
        fit: BoxFit.cover,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade900, // nền tối để làm nổi thẻ
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Tiêu đề trang
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Vertical Card Gallery ⏎',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 36,
                    color: Colors.white,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Vùng hiển thị thẻ
              Expanded(
                child: VerticalCardPager(
                  titles: titles,
                  images: images,
                  textStyle: GoogleFonts.bebasNeue(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  // onPageChanged: (page) {
                  //   debugPrint('Đang ở trang: $page');
                  // },
                  // onSelectedItem: (index) {
                  //   debugPrint('Đã chọn: ${titles[index]}');
                  // },
                ),
              ),
              const SizedBox(height: 8),
              // Hint nhỏ cho UX
              Opacity(
                opacity: 0.7,
                child: Text(
                  'Swipe up/down • Tap a card to open',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.white70,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
