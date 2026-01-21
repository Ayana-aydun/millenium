import 'package:flutter/material.dart';
import 'package:millenium/theme/colors.dart';

class CourierDeliveryPage extends StatefulWidget {
  const CourierDeliveryPage({Key? key}) : super(key: key);

  @override
  State<CourierDeliveryPage> createState() => _CourierDeliveryPageState();
}

class _CourierDeliveryPageState extends State<CourierDeliveryPage> {
  final _formKey = GlobalKey<FormState>();
  
  final TextEditingController streetController = TextEditingController();
  final TextEditingController entranceController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController apartmentController = TextEditingController();
  final TextEditingController intercomController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool showCityError = false;

  @override
  void dispose() {
    streetController.dispose();
    entranceController.dispose();
    floorController.dispose();
    apartmentController.dispose();
    intercomController.dispose();
    commentController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  bool get isFormValid {
    return streetController.text.isNotEmpty &&
           phoneController.text.isNotEmpty;
  }

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
          'Курьером',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          if (showCityError)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: const Color(0xFFFFEBEE),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF3B30),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Аптека доступна только в городе Актобе',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Город',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 358,
                      height: 52,
                      decoration: BoxDecoration(
                        color: AppColors.bgColor,
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Padding(padding: EdgeInsetsGeometry.all(16),
                      child:Text('Актобе',style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                      ),),
                    ),),
                    const SizedBox(height: 16),

                    const Text(
                      'Улица',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildTextField(
                      controller: streetController,
                      placeholder: 'Укажите улицу',
                      onChanged: (value) => setState(() {}),
                    ),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Подъезд',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              _buildTextField(
                                controller: entranceController,
                                placeholder: 'Номер подъезда',
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Этаж',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              _buildTextField(
                                controller: floorController,
                                placeholder: 'На каком этаже',
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Квартира',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              _buildTextField(
                                controller: apartmentController,
                                placeholder: 'Номер квартиры',
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Домофон',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              _buildTextField(
                                controller: intercomController,
                                placeholder: 'Номер домофона',
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    const Text(
                      'Комментарии курьеру',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildTextField(
                      controller: commentController,
                      placeholder: 'Написать',
                      maxLines: 3,
                    ),
                    const SizedBox(height: 16),

                    const Text(
                      'Номер телефона получателя',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildTextField(
                      controller: phoneController,
                      placeholder: 'Укажите номер телефона получателя',
                      keyboardType: TextInputType.phone,
                      onChanged: (value) => setState(() {}),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: isFormValid && !showCityError
                    ? () {
                        Navigator.pop(context, {
                          'street': streetController.text,
                          'entrance': entranceController.text,
                          'floor': floorController.text,
                          'apartment': apartmentController.text,
                          'intercom': intercomController.text,
                          'comment': commentController.text,
                          'phone': phoneController.text,
                        });
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF3B30),
                  disabledBackgroundColor: const Color(0xFFFFCDD2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Далее',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String placeholder,
    TextInputType? keyboardType,
    int maxLines = 1,
    Function(String)? onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        onChanged: onChanged,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.grey[400],
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}