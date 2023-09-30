import 'package:flutter/material.dart';

Widget buildCarouselItem({
  required BuildContext context,
  required String backgroundImage,
  required String title,
  required String subtitle,
}) {
  return Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(10.0),
    color: Colors.transparent,
    child: Container(
      margin: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.5),
            ],
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              subtitle,
              style: Theme.of(context).primaryTextTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}
