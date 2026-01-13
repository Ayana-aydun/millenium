import 'dart:async';
import 'package:flutter/material.dart';
import 'package:millenium/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _banners = [
    'assets/images/banner1.png',
    'assets/images/banner2.png',
    'assets/images/banner3.png',
  ];
  
  final List<_tDetails> _pop_pages = [
    _tDetails(
      image: 'assets/images/t1.png',
      title: 'Фармгрупп ООО МАГНИЙ В6-ФОРТ...',
      price: '800',
      discount: '10% Б'
    ),
    _tDetails(
      image: 'assets/images/t2.png',
      title: 'BOTO Granat collagen 15 стиков ..',
      price: '3500',
      discount: null
    ),
    _tDetails(
      image: 'assets/images/t3.png',
      title: 'Сорбифер Дурулес таблетки 100 мг 50 шт',
      price: '2600',
      discount: null
    ),
  ];
  final List<_tDetails> _saleProducts=[
        _tDetails(
      image: 'assets/images/t4.png',
      title: 'Энтерожермина Форте суспензия 4 млдрд/5 мл 10 шт',
      price: '4000',
      discount: '-20%',
      lastPrice:'5050'
    ),
    _tDetails(
      image: 'assets/images/t5.png',
      title: 'Антисептик Akmasept спрей Aloe Vera 50 мл',
      price: '300',
      discount: '-20%',
      lastPrice:'505'
    ),
    _tDetails(
      image: 'assets/images/t6.png',
      title: 'Медицинские перчатки SIgma+ винил 100 шт черный M',
      price: '600',
      discount: '-20%',
      lastPrice:'700'
    ),
    _tDetails(
      image: 'assets/images/t7.png',
      title: 'Цитрамон П таблетки 240 мг 10 шт',
      price: '135',
      discount: '-20%',
      lastPrice:'300'
    ),
  ];

  late PageController _pageController;
  int _currentIndex = 0;
  Timer? _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _autoScrollTimer = Timer.periodic(Duration(seconds: 2), (timer) {
      if (_currentIndex < _banners.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      // ===== App Bar ===== //
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: RichText(
          text: TextSpan(
            text: 'Миллениум\n',
            style: const TextStyle(
                color: Colors.red, fontSize: 18, fontWeight: FontWeight.w600),
            children: const <TextSpan>[
              TextSpan(
                  text: 'Актобе, ул. Братьев Жубановых 271',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.normal))
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset("assets/images/Frame.png", width: 24),
          )
        ],
      ),
      // ===== Body ===== //
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              child: Column(
                children: [
                  SizedBox(
                    height: 140,
                    child: PageView.builder(
                      itemCount: _banners.length,
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final banner = _banners[index];
                        return Image.asset(
                          banner,
                        );
                      },
                    ),
                  ),
                  // Индикаторы точек
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _banners.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentIndex == index
                                ? const Color.fromARGB(255, 138, 137, 137)
                                : Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
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
                          'Популярные',
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
                          return Container(
                            color: Colors.white,
                            width: 140,
                            margin: EdgeInsets.only(right: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Изображение товара
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
                                // Описание
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
                                // Цена и кнопка добавления
                                Container(
                                  height: 42,
                                  width: 98,
                                  decoration: BoxDecoration(color: AppColors.bgColor,borderRadius: BorderRadius.circular(16)),
                                  child:  Row(
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
                          );
                        },
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
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
                          'Товары в акции',
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
                        itemCount: _saleProducts.length,
                        itemBuilder: (context, index) {
                          final product = _saleProducts[index];
                          return Container(
                            color: Colors.white,
                            width: 140,
                            margin: EdgeInsets.only(right: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Изображение товара
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
                                      // Иконка избранного
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
                                // Название товара
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
                                // Цена и кнопка добавления
                                Container(
                                  height: 42,
                                  width: 108,
                                  decoration: BoxDecoration(color: AppColors.bgColor,borderRadius: BorderRadius.circular(28)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right:8,left: 8,bottom: 2),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Колонка с ценами (вертикально)
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            // Старая цена сверху
                                            Text(
                                              '${product.lastPrice} ₸',
                                              style: TextStyle(
                                                decoration: TextDecoration.lineThrough,
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                            // Текущая цена снизу
                                            Text(
                                              '${product.price} ₸',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        
                                        // Иконка справа
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
                                ),
                                );
                        },
                                ),
                    ),
                              ],
                            ),
              ),),],),),
                          );
                        }

}

class _tDetails {
  final String image;
  final String title;
  final String? lastPrice;
  final String price;
  final String? discount;

  _tDetails({
    required this.image,
    required this.title,
    this.lastPrice,
    required this.price,
    this.discount,
  });
}