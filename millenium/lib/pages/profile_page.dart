import 'package:flutter/material.dart';
import 'package:millenium/auth.dart';
import 'package:millenium/function/language.dart';
import 'package:millenium/pages/cards.dart';
import 'package:millenium/pages/favorite_page.dart';
import 'package:millenium/pages/order_page.dart';
import 'package:millenium/pages/personal_data_page.dart';
import 'package:millenium/theme/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text('Профиль',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600

        ),),
      ),
      backgroundColor: AppColors.bgColor,


      // ===== Body ===== //
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child:
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    ),
                    onPressed: () { Navigator.push(context, MaterialPageRoute(builder:(context)=> PersonalData())); },
                    child: Padding (
                      padding: EdgeInsetsGeometry.symmetric(vertical: 16) ,
                      child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                      children: [
                        Text('Жаннат Мерей',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),),
                        RotatedBox(quarterTurns: 2,
                        child: Icon(Icons.arrow_back_ios),)
                
                      ],
                    )
                    )
                  ),
              ),
                  SizedBox(height: 16,),
                  Container(
                    height: 530,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child:ListView(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      children: [
                        ListTile(
                          leading: Icon(Icons.list_alt,color: Colors.red,),
                          title: Text('Мои заказы'),
                          onTap: () {Navigator.push(context, MaterialPageRoute(builder:(context)=> MyOrdersPage()));},
                        ),
                        ListTile(
                          leading: Icon(Icons.wallet_giftcard,color: Colors.red,),
                          title: Text('Бонус'),
                          trailing: Text(
                            '300',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.favorite_outline,color: Colors.red,),
                          title: Text('Избранное'),
                          trailing: Text('6'),
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder:(context)=> const FavoritesPage())),
                        ),
                        ListTile(
                          leading: Icon(Icons.support_agent,color: Colors.red,),
                          title: Text('Служба поддержки'),
                        ),
                        ListTile(
                          leading: Icon(Icons.language,color: Colors.red,),
                          title: Text('Язык'),
                          trailing: Text('Рус'),
                          onTap: () =>ShowLanguagePicker(context),
                        ),
                        ListTile(
                          leading: Icon(Icons.payment,color: Colors.red,),
                          title: Text('Сохраненные карты '),
                          trailing: Text('2'),
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder:(context)=> const Cards()))
                        ),
                        ListTile(
                          leading: Icon(Icons.logout,color: Colors.red,),
                          title: Text('Выйти из аккаунта'),
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const AuthMainScreen())),
                        ),
                      ],
                    )
                
                  )
                ],
              ),
            
        )),
        );
  }
}