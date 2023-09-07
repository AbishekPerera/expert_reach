import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:expert_reach/constants/image_strings.dart';
import 'package:expert_reach/ui/homescreen/dashboardscreen/carousel_items.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.26,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 180,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 10),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
        items: [
          buildCarouselItem(
            context: context,
            backgroundImage: primipassi,
            title: '"Primipassi" - The First Steps',
            subtitle: 'Italian for Absolute Beginners (Kids)',
          ),
          buildCarouselItem(
            context: context,
            backgroundImage: avventura,
            title: '"Avventura Italiana"',
            subtitle: 'Italian for Beginners and Intermediate (Kids)',
          ),
          buildCarouselItem(
            context: context,
            backgroundImage: maestri,
            title: '"Maestri di Italiano"',
            subtitle: 'Advanced Italian (Kids)',
          ),
          buildCarouselItem(
            context: context,
            backgroundImage: adults1,
            title: '"Italiano per Adulti"',
            subtitle: 'Foundations for Adults (18-25 years)',
          ),
          buildCarouselItem(
            context: context,
            backgroundImage: adults2,
            title: '"Italiano per Adulti"',
            subtitle: 'Foundations for Adults (25+ years)',
          ),
          buildCarouselItem(
            context: context,
            backgroundImage: interaction,
            title: '"Italian Interaction Sessions"',
            subtitle:
                'Open to all levels from absolute beginners to advanced learners',
          ),
        ],
      ),
    );
  }
}
