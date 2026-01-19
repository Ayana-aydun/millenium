
import 'package:flutter/material.dart';
import 'package:millenium/theme/colors.dart';

void showContactBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Позвонить',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 239, 239, 239),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child:Center(
                    child:IconButton(
                      padding: EdgeInsets.zero, 
                      constraints: const BoxConstraints(),
                      icon: const Icon(Icons.close, color: Colors.black,size: 20,),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),
              const SizedBox(height: 24),
              
            Container(  
              width: 358,
              height:132 ,
              decoration: BoxDecoration(
                color: AppColors.cntColor,
                borderRadius: BorderRadius.circular(16)
              ),
              child:Stack(
                children: [
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 16,top: 16,bottom: 16),
                        child:  SizedBox(
                        width: 219,
                        height: 96,
                        child: 
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Есть вопрос или жалоба?',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1F2937),
                                ),
                                textAlign: TextAlign.start,
                              ),
                              
                              Text(
                                'Расскажите нам — мы готовы выслушать',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  height: 1.2,
                                  color: Colors.grey[600],
                                  fontSize: 16,
                                ),
                              ),
                            ]
                          ),
                          ),
                      ),
                          Positioned(
                            right: -20,
                            top: -15,
                                child: Image.asset('assets/images/phone.png',width: 224,height:150 ,))
                    ],
                  ),
              ),

              const SizedBox(height: 24),
              
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEF4444), 
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Позвонить',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              
              
              SizedBox(height: MediaQuery.of(context).padding.bottom > 0 ? 8 : 16),
            ],
          ),
        ),
      );
    },
  );
}