import 'package:flutter/material.dart';
import 'package:millenium/pages/product.dart';
import 'package:millenium/theme/colors.dart';


class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.white,
                  child: Image.asset(
                    widget.product.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                if (widget.product.isTop)
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        '10% Б',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                if (widget.product.discount != null)
                  Positioned(
                    top: widget.product.isTop ? 44 : 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '-${widget.product.discount}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            
            // const SizedBox(height: 16),
            

            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${widget.product.price.toInt()} ₸',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (widget.product.oldPrice != null) ...[
                          const SizedBox(width: 8),
                          Text(
                            '${widget.product.oldPrice!.toInt()} ₸',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[400],
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                        const Spacer(),
                        IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 8),
                    Text(
                      widget.product.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: 390,
                      height: 60,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [const Color.fromARGB(255, 255, 239, 190),const Color.fromARGB(255, 255, 231, 239)]),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          
                          Expanded(
                            child: Text(
                              '${widget.product.bonusAmount.toInt()} ₸ бонус при онлайн-покупке',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Image.asset('assets/images/coin.png')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            _buildExpandableSection('Характеристики', widget.product.characteristics),
            _buildExpandableSection('Способ применения', widget.product.usage),
            _buildExpandableSection('Условия хранения', widget.product.storage),
            _buildExpandableSection('Противопоказания', widget.product.contraindications),
            _buildExpandableSection('Производитель', widget.product.manufacturer),
            
            const SizedBox(height: 24),
            
            if (widget.product.analogs.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Аналоги и заменители',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.product.analogs.length,
                        itemBuilder: (context, index) {
                          return _buildAnalogCard(widget.product.analogs[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                    ),
                    Text(
                      '$quantity',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Добавлено в корзину: ${widget.product.title} x$quantity'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    '$quantity x ${widget.product.price.toInt()} ₸',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandableSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white
        ),
        child: ExpansionTile(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                content,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalogCard(Product analog) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: analog),
          ),
        );
      },
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  analog.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              analog.title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              '${analog.price.toInt()} ₸',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}