import 'package:flutter/material.dart';
import 'package:millenium/pages/detail_order.dart';
import 'package:millenium/theme/colors.dart';

class MyOrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), 
      appBar: AppBar(
        title: const Text('Мои заказы', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
        children: [
          _buildOrderListItem(
            context: context,
            description:'Ваш заказ принят,доставим в 17:00–18:00',
            orderNumber: '№0001 АКТИВНЫЙ',
            address:'Мкр.Кулагер, 7',
            price: '45 005 ₸',
            image:Image.asset('assets/images/t1.png',fit: BoxFit.contain),
            image2:Image.asset('assets/images/t2.png',fit: BoxFit.contain),
            statusColor: AppColors.cntColor,
            TextColor:Colors.red
          ),
          SizedBox(height: 32,),
          Text('История',style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey
          ),),
          SizedBox(height: 16,),
          _buildOrderListItem(
            context: context,
            description: '10 января 2025',
            orderNumber: '№0002 ОТМЕНЕН',
            address:'Мкр.Кулагер, 7',
            price: '45 005 ₸',
            image:Image.asset('assets/images/t1.png',fit: BoxFit.contain),
            image2:Image.asset('assets/images/t2.png',fit: BoxFit.contain),
            statusColor: const Color.fromARGB(255, 229, 229, 229),
            TextColor:Colors.black
          ),
          SizedBox(height: 8,),
          _buildOrderListItem(
            context: context,
            description: '05 января 2025',
            orderNumber: '№0003 Вручен',
            address:'Мкр.Кулагер, 7',
            price: '45 005 ₸',
            image:Image.asset('assets/images/t1.png',fit: BoxFit.contain),
            image2:Image.asset('assets/images/t2.png',fit: BoxFit.contain),
            statusColor: const Color.fromARGB(255, 202, 255, 229),
            TextColor:Colors.green
          ),
        ],
      ),
    );
  }

  Widget _buildOrderListItem({
    required BuildContext context,
    required String orderNumber,
    required String price,
    required Color statusColor, 
    required String description, 
    required Color TextColor, 
    required String address, 
    required Image image, 
    required Image image2,
  }) {
    return Column(
      children: [
        Container(
          width: 359,
          height: 36,
          decoration: BoxDecoration(
            color: statusColor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16))

          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 16,vertical: 2),
              child:TextButton( onPressed: () { 
                Navigator.push(context, MaterialPageRoute(builder:(context)=> const OrderDetailScreen()));
               },  style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact, 
                tapTargetSize: MaterialTapTargetSize.shrinkWrap, ),
                child: Text(orderNumber,style: TextStyle(
                color: TextColor,
                fontSize: 14,
                height: 1.0,
                fontWeight: FontWeight.w500
              )),),),

            ],
          ),
        ),
        Container(
          width: 359,
          height: 160,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16),bottomRight: Radius.circular(16))
          ),
          child:Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 16,vertical: 8),
           child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(description,style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(address,style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500
                  ),),
                  Text(price,style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w700
                  ),)
                ],
              ),
              Row(
                children: [
                  _buildPhotoContainer(image),
                  SizedBox(width: 8,),
                  _buildPhotoContainer(image2)
                ],
              )
            ],
          ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoContainer(Image image) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        border:Border.all(color: AppColors.bgColor)
      ),
      child:Center(
        child: image,
          ),
    );
  }
}