import 'dart:html';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:renting_app_ui/data/products.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double screenWidth = MediaQuery.of(context).size.width - 32;

    print(screenWidth);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
        titleTextStyle:
            theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton.filledTonal(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
              style: IconButton.styleFrom(
                  foregroundColor: theme.colorScheme.primary),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(top: 15),
          children: [
            SizedBox(
              height: 250,
              child: PageView.builder(
                itemCount: 3,
                onPageChanged: (value) {
                  setState(() {
                    activeIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  print(context);
                  print(index);
                  return Container(
                    height: 250,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    width: double.maxFinite,
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(widget.product.image),
                      ),
                    ),
                    child: Row(
                      children: [
                        HowFarFrom(theme: theme),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Available",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                IconlyBold.star,
                                size: 18,
                                color: theme.colorScheme.primary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "4.9",
                                style: TextStyle(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: 3,
                effect: WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  dotColor: Colors.grey.shade300,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // should be widget
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?q=80&w=2662&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
              ),
              title: const Text("Atl"),
              subtitle: Row(
                children: [
                  // Rating flutter
                  ...List.generate(
                    4,
                    (index) => Icon(
                      IconlyBold.star,
                      size: 16,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const Icon(
                    IconlyBold.star,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  const Text("4.7")
                ],
              ),
              trailing: SizedBox(
                width: 35,
                height: 35,
                child: IconButton.filledTonal(
                  onPressed: () {},
                  icon: const Icon(Icons.chevron_right),
                  style: IconButton.styleFrom(
                      foregroundColor: theme.colorScheme.primary),
                  padding: EdgeInsets.zero,
                ),
              ),
              titleTextStyle: theme.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // GridView.count(
                  //   crossAxisCount: 3,
                  //   children: List.generate(100, (index) {
                  //     return Center(
                  //       child: Text(
                  //         'Item $index',
                  //         style: Theme.of(context).textTheme.headlineSmall,
                  //       ),
                  //     );
                  //   }),
                  // ),
                  Row(
                    children: [
                      Container(
                        width: screenWidth * 0.33,
                        height: 125,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Hourly",
                              style: theme.textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Text(
                                "\$5.00",
                                style: theme.textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Text("/ hour"),
                          ],
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.33,
                        height: 125,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Daily",
                              style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Text(
                                "\$15.00",
                                style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            const Text(
                              "/ day",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.33,
                        height: 125,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Monthly",
                              style: theme.textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Text(
                                "\$40.00",
                                style: theme.textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Text("/ month"),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  ListTile(
                    tileColor: theme.colorScheme.primaryContainer,
                    leading: const Icon(IconlyLight.calendar),
                    iconColor: theme.colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    titleTextStyle: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    title: const Text("4 days"),
                    trailing:
                        Text("Set dates", style: theme.textTheme.bodyLarge),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          textStyle: theme.textTheme.bodyLarge),
                      child: const Text("Lease for \$65.00"),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HowFarFrom extends StatelessWidget {
  const HowFarFrom({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        children: [
          Icon(
            IconlyLight.location,
            size: 16,
            color: Colors.white,
          ),
          Text(
            "4.0km",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
