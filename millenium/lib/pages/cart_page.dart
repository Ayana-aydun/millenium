import 'package:flutter/material.dart';
import 'package:millenium/pages/detail_page.dart';
import 'package:millenium/function/product.dart';
import 'package:millenium/theme/colors.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
      List<Product> get cartItems => CartService.cartItems;

  bool get isCartEmpty => cartItems.isEmpty;

  final List<_tDetails> _pop_pages = [
    _tDetails(
      id:'1',
      image: 'assets/images/t1.png',
      title: 'Фармгрупп ООО МАГНИЙ В6-ФОРТ...',
      price: '800',
      discount: '10% Б'
    ),
    _tDetails(
      id:'2',
      image: 'assets/images/t2.png',
      title: 'BOTO Granat collagen 15 стиков ..',
      price: '3500',
      discount: null
    ),
    _tDetails(
      id:'3',
      image: 'assets/images/t3.png',
      title: 'Сорбифер Дурулес таблетки 100 мг 50 шт',
      price: '2600',
      discount: null
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        title: const Text(
          'Корзина',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isCartEmpty)
                EmptyCartWidget()
            else
               CartItemsListWidget(),

            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Container( 
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Рекомендуем',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward)
                        ],
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        height: 252,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _pop_pages.length,
                          itemBuilder: (context, index) {
                            final product = _pop_pages[index];
                            return GestureDetector(  
                            onTap: () {
                              final detailProduct = ProductData.getProductById(product.id );
                              if (detailProduct != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailPage(product: detailProduct),
                                  ),
                                );
                              }
                            },
                            child:  Container(
                              color: Colors.white,
                              width: 140,
                              margin: EdgeInsets.only(right: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 140,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(color: AppColors.bgColor)
                                      ),
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Image.asset(
                                              product.image,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          // bonus
                                          if (product.discount != null)
                                            Positioned(
                                              top: 8,
                                              left: 8,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  product.discount!,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          Positioned(
                                            top: 8,
                                            right: 8,
                                            child: Icon(
                                              Icons.favorite_border,
                                              color: Colors.grey[400],
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    product.title,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 42,
                                    width: 98,
                                    decoration: BoxDecoration(
                                      color: AppColors.bgColor,
                                      borderRadius: BorderRadius.circular(16)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          '${product.price} ₸',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Icon(
                                          Icons.add,
                                          color: Colors.red,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
Widget EmptyCartWidget(){
   return Column(children: [
   SizedBox(height: 110),
             Center(
            child:Column(
              children: [ 
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 223, 223, 223),
                    borderRadius: BorderRadius.circular(40)
                  ),
                  child:Icon(
                  Icons.shopping_basket_outlined,
                  size: 40,
                  color: Colors.grey,
                ),),
                SizedBox(height: 12),
                Text(
                  'Корзина пока пуста',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
            
              ],),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    
                  },
                  style: ElevatedButton.styleFrom(
                    
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Начать поиск',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
   ]
            );
}

Widget CartItemsListWidget(){
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text('Корзина', style: TextStyle(color: Colors.black, fontSize: 18)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black), onPressed: () {}),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Color(0xFFFFF1F1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFFFFDADA)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Выберите способ доставки', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500)),
                  Icon(Icons.chevron_right, color: Colors.red),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Изменения в корзине', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 12),
                  _buildCartItem(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomButton(),
    );
  }

  Widget _buildCartItem() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 60, height: 60, color: Colors.grey[200]), // Заглушка для фото товара
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Название препарата из дизайна...', style: TextStyle(fontSize: 14)),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCounter(),
                    Text('44 400 ₸', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.favorite_border, color: Colors.grey, size: 20),
        ],
      ),
    );
  }

  Widget _buildCounter() {
    return Row(
      children: [
        Icon(Icons.remove, color: Colors.red, size: 20),
        Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text('1')),
        Icon(Icons.add, color: Colors.red, size: 20),
      ],
    );
  }

  Widget _buildBottomButton() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.white,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {},
        child: Text('Завершить покупку', style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );

}
  


class _tDetails {
  final String id;
  final String image;
  final String title;
  final String price;
  final String? discount;

  _tDetails({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    this.discount, 
  });
}