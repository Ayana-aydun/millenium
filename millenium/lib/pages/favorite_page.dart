
import 'package:flutter/material.dart';
import 'package:millenium/theme/colors.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
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
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            const SizedBox(width: 85),
            const Text('Избранное',style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
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
                          onChanged: (value) {
                            setState(() {});
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
              child: _buildProductGrid(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid() {
    // Примерные данные товаров
    final products = [
      {
        'name': 'Энтерожермина Форте суспензия 4 млндр/5 мл 10 шт',
        'price': '4000',
        'lastPrice': '5050',
        'discount': '-20%',
        'image': 'assets/images/t4.png',
        'isFavorite': true,
      },
      {
        'name': 'Цитрамон П таблетки 240 мг 10 шт',
        'price': '135',
        'lastPrice': '300',
        'count': 2,
        'discount': '-20%',
        'image': 'assets/images/t7.png',
        'isFavorite': true,
      },
      {
        'name': 'Антисептик Akmasept спрей Aloe Vera 50 мл',
        'price': '300',
        'lastPrice': '505',
        'discount': '-20%',
        'image': 'assets/images/t5.png',
        'isFavorite': true,
      },
      {
        'name': 'Медицинские перчатки SIgma+ винил 100 шт черный M',
        'price': '600',
        'lastPrice': '700',
        'discount': '-20%',
        'image': 'assets/images/t6.png',
        'isFavorite': true,
      },
      {
        'name': 'Энтерожермина Форте суспензия 4 млндр/5 мл 10 шт',
        'price': '4000',
        'lastPrice': '5050',
        'discount': '-20%',
        'image': 'assets/images/t4.png',
        'isFavorite': true,
      },
      {
        'name': 'Цитрамон П таблетки 240 мг 10 шт',
        'price': '135',
        'lastPrice': '300',
        'discount': '-20%',
        'image': 'assets/images/t7.png',
        'isFavorite': true,
      },
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return _buildProductCard(product);
      },
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.bgColor),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      product['image'],
                      fit: BoxFit.contain,
                    ),
                  ),
                  // Discount badge
                  if (product['discount'] != null)
                    Positioned(
                      bottom: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          product['discount'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  // Favorite button
                  Positioned(
                    top: -5,
                    left: 100,
                    child: IconButton(
                      icon: Icon(
                        product['isFavorite'] ? Icons.favorite : Icons.favorite_border,
                        color: product['isFavorite'] ? Colors.red : Colors.grey,
                        size: 24,
                      ),
                      onPressed: () {
                        setState(() {
                          product['isFavorite'] = !product['isFavorite'];
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              product['name'],
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: product['count'] != null
                ? Container(
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppColors.bgColor,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove, size: 20),
                          onPressed: () {
                            setState(() {
                              if (product['count'] > 1) {
                                product['count']--;
                              }
                            });
                          },
                          padding: EdgeInsets.zero,
                        ),
                        Text(
                          '${product['count']}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add, size: 20, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              product['count']++;
                            });
                          },
                          padding: EdgeInsets.zero,
                        ),
                      ],
                    ),
                  )
                : Container(
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppColors.bgColor,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (product['lastPrice'] != null) ...[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${product['lastPrice']} ₸',
                                  style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                    fontSize: 12,
                                    height: 1.0,
                                  ),
                                ),
                                Text(
                                  '${product['price']} ₸',
                                  style: const TextStyle(
                                    height: 1.2,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ] else
                            Text(
                              '${product['price']} ₸',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.red,
                              size: 24,
                            ),
                            onPressed: () {
                              setState(() {
                                product['count'] = 1;
                              });
                            },
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}