import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'carouselprovider.dart';

class PageViewCarousel extends StatelessWidget {
  final List<String> images;
  final PageController pageController;

  const PageViewCarousel({
    super.key,
    required this.images,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CarouselProvider>(context, listen: false);
    return PageView.builder(
      controller: pageController,
      itemCount: images.length,
      onPageChanged: (index) {
        provider.updateIndex(index);
      },
      itemBuilder: (context, index) {
        return Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              child: Image.asset(
                images[index],
                fit: BoxFit.fill,
              ),
            ),
            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withOpacity(0.95),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
