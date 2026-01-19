import 'package:flutter/material.dart';
import 'package:millenium/theme/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey[600]),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Искать',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16,
                              ),
                            ),
                            onSubmitted: (value) {
                              print('Поиск: $value');
                            },
                          ),
                        ),
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
                              () => _navigateToCategory(context, 'Акции'),
                            ),
                            const SizedBox(height: 16),
                            _buildCategoryCard(
                              context,
                              'Бьюти-уход',
                              'assets/images/p3.png',
                              () => _navigateToCategory(context, 'Бьюти-уход'),
                            ),
                            const SizedBox(height: 16),
                            _buildCategoryCard(
                              context,
                              'Гигиена',
                              'assets/images/p5.png',
                              () => _navigateToCategory(context, 'Гигиена'),
                            ),
                            const SizedBox(height: 16),
                            _buildCategoryCard(
                              context,
                              'Медизделия',
                              'assets/images/p7.png',
                              () => _navigateToCategory(context, 'Медизделия'),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            _buildCategoryCard(
                              context,
                              'Лекарства',
                              'assets/images/p2.png',
                              () => _navigateToCategory(context, 'Лекарства'),
                            ),
                            const SizedBox(height: 16),
                            _buildCategoryCard(
                              context,
                              'БАД и витамины',
                              'assets/images/p4.png',
                              () => _navigateToCategory(context, 'БАД и витамины'),
                            ),
                            const SizedBox(height: 16),
                            _buildCategoryCard(
                              context,
                              'Мать и дитя',
                              'assets/images/p6.png',
                              () => _navigateToCategory(context, 'Мать и дитя'),
                            ),
                            const SizedBox(height: 16),
                            _buildCategoryCard(
                              context,
                              'Медтехника',
                              'assets/images/p8.png',
                              () => _navigateToCategory(context, 'Медтехника'),
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

  void _navigateToCategory(BuildContext context, String categoryName) {
    // Навигация к странице категории
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryPage(categoryName: categoryName),
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

class CategoryPage extends StatefulWidget {
  final String categoryName;

  const CategoryPage({super.key, required this.categoryName});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
              constraints: const BoxConstraints(),
            ),
            Center (child:Text(widget.categoryName,style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),),)
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {
              print('Фильтры открыты');
            },
          ),
        ],
      ),
      body: Column(
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
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey[600]),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Искать',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16,
                            ),
                          ),
                          onSubmitted: (value) {
                            print('Поиск в категории ${widget.categoryName}: $value');
                          },
                        ),
                      ),
                      if (_searchController.text.isNotEmpty)
                        IconButton(
                          icon: Icon(Icons.close, color: Colors.grey[600], size: 20),
                          onPressed: () {
                            setState(() {
                              _searchController.clear();
                            });
                          },
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Center(
                child: Text('Товары категории: ${widget.categoryName}'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}