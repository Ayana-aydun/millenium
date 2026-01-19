import 'package:flutter/material.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({super.key});

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

    @override
  void initState() {
    super.initState();
    _nameController.addListener(() => setState(() {}));
    _phoneController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Личные данные',style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),),
    ),
    body: Padding(padding: EdgeInsetsGeometry.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildTextField('Фамилия', _nameController, 'Жаннат'),
        const SizedBox(height: 18),
        _buildTextField('Имя', _nameController, 'Мерей'),
        const SizedBox(height: 18),
        _buildTextField('Номер телефона', _phoneController, '77777777777'),
        Spacer(),
        SizedBox(
          width: 358,
          height: 52,
          child: ElevatedButton(onPressed: (){}, 
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red,shape:RoundedRectangleBorder(borderRadius:  BorderRadius.circular(16))),
          child: Text('Сохранить',style:TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.white),)),
        )
      ],
    ),
    ),
    );
  }
    Widget _buildTextField(String label, TextEditingController controller, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[600],
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: controller,
            style: const TextStyle(fontSize: 15),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            ),
          ),
        ),
      ],
    );
  }
  
}