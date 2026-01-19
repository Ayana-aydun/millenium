import 'package:flutter/material.dart';
import 'package:millenium/theme/colors.dart';

void ShowLanguagePicker(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, 
    backgroundColor: AppColors.bgColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Язык',
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
            const SizedBox(height: 8),
            
            Container(
              width: 358,
              height: 115,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                  child: Column(
                  children: [
                    _buildLanguageItem('Қазақша', isSelected: true),
                    const Divider(height: 1), 
                    _buildLanguageItem('Русский', isSelected: false),
                  ],
                  ),
              ),
              ),
              SizedBox(height: 16,)
          ],
            ),
            
      );  
    },
  );
}

Widget _buildLanguageItem(String title, {required bool isSelected}) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(
      title,
      style: const TextStyle(fontSize: 16),
    ),
    trailing: isSelected 
      ? const Icon(Icons.check, color: Colors.red) 
      : null,
    onTap: () {
    },
  );
}