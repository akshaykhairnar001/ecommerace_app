import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerTile extends StatefulWidget {
  final List<String> imagePaths;

  const BannerTile({super.key, required this.imagePaths});

  @override
  _BannerTileState createState() => _BannerTileState();
}

class _BannerTileState extends State<BannerTile> {
  final PageController _controller = PageController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSwipe();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startAutoSwipe() {
    _timer = Timer.periodic(const Duration(seconds: 6), (Timer timer) {
      if (_controller.page == widget.imagePaths.length - 1) {
        _controller.jumpToPage(0);
      } else {
        _controller.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Material(
            elevation: 10,
            child: SizedBox(
              height: 200,
              child: PageView(
                controller: _controller,
                children: widget.imagePaths.map((path) {
                  return Image.asset(
                    path,
                    fit: BoxFit.cover,
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 15),
          SmoothPageIndicator(
            controller: _controller,
            count: widget.imagePaths.length,
            effect: const SwapEffect(
              dotWidth: 8.0,
              dotHeight: 8.0,
            ),
          ),
        ],
      ),
    );
  }
}
