import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Спасибо за заказ',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body:  Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            height: 610,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 227, 255, 241),
              borderRadius: BorderRadius.circular(16)
            ),
          child:Expanded(
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/success.png',width: 54,),
                    const SizedBox(height: 24),
                    const Text(
                      'Спасибо за заказ',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Заберите заказ в течение 48 часов, иначе он будет отменен',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontStyle: FontStyle.italic
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16,),
            SafeArea(
              child: SizedBox(
                width: 390,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Открыть детали заказа',
                    style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),

        ],
      ),
      ),
    );
  }
}