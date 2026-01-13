import 'package:flutter/material.dart';
import 'package:millenium/theme/colors.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Поиск'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.centerLeft,
                    child: Row(children: [
                      Icon(Icons.search),
                      Text('Поиск...'),
                    ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            _buildCategoryCard(
                              context,
                              'Акции',
                              'assets/images/p1.png',
                              () => print('Акции clicked'),
                            ),
                            const SizedBox(height: 16),
                            _buildCategoryCard(
                              context,
                              'Бьюти-уход',
                              'assets/images/p3.png',
                              () => print('Бьюти-уход clicked'),
                            ),
                            const SizedBox(height: 16),
                            _buildCategoryCard(
                              context,
                              'Гигиена',
                              'assets/images/p5.png',
                              () => print('Гигиена clicked'),
                            ),
                            const SizedBox(height: 16),
                            _buildCategoryCard(
                              context,
                              'Медизделия',
                              'assets/images/p7.png',
                              () => print('Медизделия clicked'),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            _buildCategoryCard(
                              context,
                              'Лекарства',
                              'assets/images/p2.png',
                              () => print('Лекарства clicked'),
                            ),
                            const SizedBox(height: 16),
                            _buildCategoryCard(
                              context,
                              'БАД и витамины',
                              'assets/images/p4.png',
                              () => print('БАД и витамины clicked'),
                            ),
                            const SizedBox(height: 16),
                            _buildCategoryCard(
                              context,
                              'Мать и дитя',
                              'assets/images/p6.png',
                              () => print('Мать и дитя clicked'),
                            ),
                            const SizedBox(height: 16),
                            _buildCategoryCard(
                              context,
                              'Медтехника',
                              'assets/images/p8.png',
                              () => print('Медтехника clicked'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    String title,
    String imagePath,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 92,
            width: 175,
            decoration: BoxDecoration(
              color: AppColors.cntColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                width: 68,
                height: 68,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}