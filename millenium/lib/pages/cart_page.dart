import 'package:flutter/material.dart';
import 'package:millenium/function/product.dart';
import 'package:millenium/pages/%D1%81ourier_delivery_page.dart';
import 'package:millenium/pages/detail_home.dart';
import 'package:millenium/pages/detail_page.dart';
import 'package:millenium/pages/map_selecrion_screen.dart';
import 'package:millenium/pages/succes_page.dart';
import 'package:millenium/theme/colors.dart';


class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int? selectedDeliveryIndex;
  PharmacyLocation? selectedPharmacy; 
  String? courierAddress; 
  bool showDeliveryOptions = false;
  bool isFavorite = false;
    final List<_tDetails> _saleProducts=[
      _tDetails(
      id: '4',
      image: 'assets/images/t4.png',
      title: 'Энтерожермина Форте суспензия 4 млдрд/5 мл 10 шт',
      price: '4000',
      discount: '-20%',
      lastPrice:'5050'
    ),
    _tDetails(
      id: '5',
      image: 'assets/images/t5.png',
      title: 'Антисептик Akmasept спрей Aloe Vera 50 мл',
      price: '300',
      discount: '-20%',
      lastPrice:'505'
    ),
    _tDetails(
      id: '6',
      image: 'assets/images/t6.png',
      title: 'Медицинские перчатки SIgma+ винил 100 шт черный M',
      price: '600',
      discount: '-20%',
      lastPrice:'700'
    ),
    _tDetails(
      id: '7',
      image: 'assets/images/t7.png',
      title: 'Цитрамон П таблетки 240 мг 10 шт',
      price: '135',
      discount: '-20%',
      lastPrice:'300'
    ),
  ];

  final List<CartItem> cartItems = [
    CartItem(
      id: 1,
      name: 'Нет в наличии',
      description: 'Энтерожермина Форте суспензия 4 млдрд/5 мл 10 шт',
      category: '',
      quantity: 1,
      price: 0,
      isFavorite: false, 
      image: Image.asset('assets/images/t2.png'), 
      inStock: false
    ),
    CartItem(
      id: 2,
      image:Image.asset('assets/images/t2.png'),
      name: 'Акнекутан капсулы 16 мг 30 шт',
      description: '',
      category: '',
      quantity: 2,
      price: 44870,
      isFavorite: false,
      inStock: true,
    ),
    CartItem(
      id: 3,
      name: 'Ципрадол Н таблетки 240 мг 10 шт',
      description: '',
      category: '',
      quantity: 1,
      price: 135,
      isFavorite: true,
      image: Image.asset('assets/images/t2.png'), 
      inStock: true,
    ),
  ];

  final List<String> deliveryMethods = [
    'Самовывоз',
    'Курьером',
  ];

  int getTotalPrice() {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Корзина',
          style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(child: Column(
        children: [
          SizedBox(height: 16,),
            if (selectedDeliveryIndex == null) 
                       Container(
                width: 358,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.cntColor,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(onPressed:(){ _showCheckoutBottomSheet(context);}, child:  const Text(
                        'Выберите способ доставки',
                        style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w600),
                      ),),
                      Icon(
                         Icons.keyboard_arrow_right,
                        color: Colors.red,
                        size: 36,
                      ),
                    ],
                  ),
              ),


            if (selectedDeliveryIndex == 1 && courierAddress != null)        Container(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            width: 358,
            height: 95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Способ доставки:  Курьером',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),
                    ),InkWell(
                      onTap: () => _showDeliveryModal(context),
                      child: const Icon(Icons.chevron_right, size: 30, color: Colors.grey),
                    )

                  ],
                ),
                _buildRow(Icons.location_on, 'Адрес аптеки'),
              ],
            ),
          ),

            if (selectedDeliveryIndex == 0 && selectedPharmacy != null)         Container(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            width: 358,
            height: 142,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Способ доставки:  Самовывоз',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),
                    ),InkWell(
                      onTap: () => _showDeliveryModal(context),
                      child: const Icon(Icons.chevron_right, size: 30, color: Colors.grey),
                    )

                  ],
                ),
                _buildRow(Icons.location_on, 'Адрес аптеки'),
                _buildRow(Icons.phone, '8 777 777 77 77'),
              ],
            ),
          ),
          //  Container(
          //       width: 358,
          //       height: 56,
          //       decoration: BoxDecoration(
          //         color: AppColors.cntColor,
          //         borderRadius: BorderRadius.circular(16)
          //       ),
          //       child: 
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: [
          //             TextButton(onPressed:(){ _showCheckoutBottomSheet(context);}, child:  const Text(
          //               'Выберите способ доставки',
          //               style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w600),
          //             ),),
          //             Icon(
          //                Icons.keyboard_arrow_right,
          //               color: Colors.red,
          //               size: 36,
          //             ),
          //           ],
          //         ),
          //     ),


          const SizedBox(height: 16),

          Padding(padding:EdgeInsetsGeometry.symmetric(horizontal: 16),
          child:Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Изменения в корзине',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                for (int i = 0; i < cartItems.length; i++) ...[
                  CartItemWidget(
                    item: cartItems[i],
                    onQuantityChanged: (newQuantity) {
                      setState(() {
                        cartItems[i].quantity = newQuantity;
                      });
                    },
                    onFavoriteToggle: () {
                      setState(() {
                        cartItems[i].isFavorite = !cartItems[i].isFavorite;
                      });
                    },
                  ),
                  if (i != cartItems.length - 1)
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xFFE0E0E0),
                    ),
                ]

              ],
            ),
          ),),

          const SizedBox(height: 24),
          Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            child:Container(
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
                        IconButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>  DetailHome(categoryName: 'Товары в акции',)));
                        },
                        icon: Icon(Icons.arrow_forward,color: Colors.black,))
                      ],
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 252,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _saleProducts.length,
                        itemBuilder: (context, index) {
                          final product = _saleProducts[index];
                          return GestureDetector( 
                            onTap: () {
                              final detailProduct = ProductData.getProductById(product.id);
                              if (detailProduct != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailPage(product: detailProduct),
                                  ),
                                );
                              }
                            },
                            child: Container( 
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
                                  child:Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),border: Border.all(color: AppColors.bgColor)),
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
                                          bottom: 8,
                                          left: 8,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
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
                                        top: -5,
                                        left: 100,
                                        child: IconButton(
                                        icon: Icon(
                                          isFavorite ? Icons.favorite : Icons.favorite_border,
                                          color: isFavorite ? Colors.red : Colors.grey,
                                          size: 24,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            isFavorite = !isFavorite;
                                          });
                                        },
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
                                  width: 108,
                                  decoration: BoxDecoration(color: AppColors.bgColor,borderRadius: BorderRadius.circular(28)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 4,right: 12,left: 12),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              '${product.lastPrice} ₸',
                                              style: TextStyle(
                                                decoration: TextDecoration.lineThrough,
                                                color: Colors.grey,
                                                fontSize: 12,
                                                height: 1.0
                                              ),
                                            ),
                                            Text(
                                              '${product.price} ₸',
                                              style: TextStyle(
                                                height: 1.2,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                        Center(child: 
                                        Icon(
                                          Icons.add,
                                          color: Colors.red,
                                          size: 24,
                                        ),
                                        
                                      ),
                                  
                                  ],
                                ),
                                  ),
                                ),
                                    ],
                                ),),
                                );
                        },
                                ),
                    ),
                              ],
                            ),
              ),),),

          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (selectedDeliveryIndex == null) {
                        _showCheckoutBottomSheet(context);
                      }if (selectedDeliveryIndex != null) {
                        Navigator.push(context, MaterialPageRoute(builder:(context)=> const SuccessPage()));
                      }
                      
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Завершить покупку',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.white),
                    ),
                  ),
                ),
                TextButton(onPressed: (){},
                  child:Text(
                    'Продолжить покупки',
                    style: TextStyle(color: Colors.red, fontSize: 18,fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
//Всплывающее окно
void _showCheckoutBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent, 
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.bgColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Выберите способ доставки',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 30,),
                Container(
                  width:24 ,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 230, 229, 229),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child:IconButton(     
                  padding: EdgeInsets.zero,  
                  icon: const Icon(Icons.close,size: 17,color: Colors.black,),
                  onPressed: () => Navigator.pop(context),
                ),),
              ],
            ),
            const SizedBox(height: 20),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(deliveryMethods.length, (index) {
                  final method = deliveryMethods[index];
                  return Column(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(0), 
                        onTap: () async {
                          Navigator.pop(context);

                          if (index == 0) {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MapSelectionScreen(),
                              ),
                            );
                            

                            if (result != null && result is PharmacyLocation) {
                              setState(() {
                                selectedDeliveryIndex = 0;
                                selectedPharmacy = result;     
                                courierAddress = null;        
                              });
                            }
                          }

                          // 1 — Курьер
                          else {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CourierDeliveryPage(),
                            ),
                          );

                          if (result != null && result is String) {
                            setState(() {
                              selectedDeliveryIndex = 1;
                              courierAddress = result;
                              selectedPharmacy = null;
                            });
                          }
}

                        },

                        child: Container(
                          height: 56,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                method,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              if (selectedDeliveryIndex == index)
                                const Icon(Icons.check, color: Colors.red),
                            ],
                          ),
                        ),
                      ),
                      if (index != deliveryMethods.length - 1)
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: AppColors.bgColor,
                        ),
                    ],
                  );
                }),
              ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      );
    },
  );
}
void _showDeliveryModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
        decoration: const BoxDecoration(
          color: AppColors.bgColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Выберите способ доставки',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6E5E5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.close, size: 16),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      Navigator.pop(context);

                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MapSelectionScreen(),
                        ),
                      );

                      if (result != null && result is PharmacyLocation) {
                        setState(() {
                          selectedDeliveryIndex = 0;
                          selectedPharmacy = result;
                          courierAddress = null;
                        });
                      }
                    },
                    child: _deliveryItem(
                      title: 'Самовывоз',
                      subtitle: selectedPharmacy?.address,
                      isSelected: selectedDeliveryIndex == 0,
                      showEditIcon: selectedPharmacy != null,
                    ),
                  ),

                  const Divider(height: 1),

                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        selectedDeliveryIndex = 1;
                        courierAddress = 'Алматы, ул. Абая 10';
                        selectedPharmacy = null;
                      });
                    },
                    child: _deliveryItem(
                      title: 'Курьером',
                      subtitle: courierAddress,
                      isSelected: selectedDeliveryIndex == 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
Widget _deliveryItem({
  required String title,
  String? subtitle,
  required bool isSelected,
  bool showEditIcon = false,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isSelected ? Colors.black : Colors.grey,
        ),
        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ],
          ),
        ),

        if (showEditIcon)
          const Icon(Icons.edit, color: Colors.red, size: 18),
      ],
    ),
  );
}


}

class CartItem {
  final int id;
  final String name;
  final String description;
  final String category;
  final Image image;
  int quantity;
  final int price;
  bool isFavorite;
  bool inStock;

  CartItem( {
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.quantity,
    required this.price,
    required this.isFavorite, 
    required this.inStock,
    required this.image,
  });
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final Function(int) onQuantityChanged;
  final VoidCallback onFavoriteToggle;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onQuantityChanged,
    required this.onFavoriteToggle,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.bgColor),
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Opacity(
              opacity: item.inStock ? 1 : 0.4,
              child: item.image,
),

          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (item.category.isNotEmpty)
                  Text(
                    item.category,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                Text(
                  item.name,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                if (item.description.isNotEmpty)
                  Text(
                    item.description,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    if (item.inStock)
                      Container(
                        width: 111,
                        height: 40,
                        decoration: BoxDecoration(
                          
                          color: AppColors.bgColor,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove, size: 18, color: Colors.red),
                              onPressed: () {
                                if (item.quantity > 1) {
                                  onQuantityChanged(item.quantity - 1);
                                }
                              },
                              padding: const EdgeInsets.all(4),
                              constraints: const BoxConstraints(),
                            ),
                            Text(
                              '${item.quantity}',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add, size: 18, color: Colors.red),
                              onPressed: () {
                                onQuantityChanged(item.quantity + 1);
                              },
                              padding: const EdgeInsets.all(4),
                              constraints: const BoxConstraints(),
                            ),
                          ],
                        ),
                      )
                    else
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.bgColor,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: const Icon(Icons.delete, size: 25),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            width: 111,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.bgColor,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: const Center(
                              child: Text(
                                'Аналоги',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                    const Spacer(),

                    if (item.inStock)
                      Text(
                        '${item.price * item.quantity} ₸',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                  
                                  ],
                ),
              ],
            ),
          ),
        ]
      )
    );
  }
}
Widget _buildRow(IconData icon, String text) {
  return ListTile(
    leading: Container(
      width:32 ,
      height:32 ,
      decoration: BoxDecoration(
        color: AppColors.cntColor,
        borderRadius: BorderRadius.circular(12)
      ),
      child:
        Icon(icon, color: Colors.black),
    ),
    title: Text(text, style: const TextStyle(fontSize: 16,fontWeight:FontWeight.w500,height: 1.0)),
    contentPadding: EdgeInsets.zero, 
    dense: true,
  );
}
class _tDetails {
  final String id;
  final String image;
  final String title;
  final String? lastPrice;
  final String price;
  final String? discount;

  _tDetails({
    required this.id,
    required this.image,
    required this.title,
    this.lastPrice,
    required this.price,
    this.discount,
  });
}