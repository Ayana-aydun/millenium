import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Figma Design',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFDF291D)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const SavedCardsScreen(),
    );
  }
}

class CreditCardModel {
  final String id;
  final String type; 
  final String lastFourDigits;
  final bool isExpired;

  CreditCardModel({
    required this.id,
    required this.type,
    required this.lastFourDigits,
    this.isExpired = false,
  });
}

class SavedCardsScreen extends StatefulWidget {
  const SavedCardsScreen({super.key});

  @override
  State<SavedCardsScreen> createState() => _SavedCardsScreenState();
}

class _SavedCardsScreenState extends State<SavedCardsScreen> {
  List<CreditCardModel> cards = [
    CreditCardModel(
      id: '1',
      type: 'Mastercard',
      lastFourDigits: '8073',
      isExpired: false,
    ),
    CreditCardModel(
      id: '2',
      type: 'Visa',
      lastFourDigits: '8090',
      isExpired: true, 
    ),
  ];

  void _deleteCard(String id) {
    if (!mounted) return; 
    
    setState(() {
      cards.removeWhere((card) => card.id == id);
    });
  }

  void _showDeleteDialog(BuildContext context, CreditCardModel card) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) { 
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            "Удалить?",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          content: Text(
            "Вы действительно хотите удалить\nкарту ${card.type} •••• ${card.lastFourDigits}?",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text(
                "Отмена",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                
                _deleteCard(card.id);
              },
              child: const Text(
                "Да",
                style: TextStyle(
                  color: Color(0xFFDF291D),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {}, 
        ),
        title: const Text("Сохраненные карты оплаты"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: cards.isEmpty
                  ? _buildEmptyState() 
                  : _buildCardList(), 
            ),
            _buildAddButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCardList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      itemCount: cards.length,
      itemBuilder: (context, index) {
        final card = cards[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
            border: Border.all(color: Colors.grey.withOpacity(0.1)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    card.type,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  InkWell(
                    onTap: () => _showDeleteDialog(context, card),
                    child: const Icon(
                      Icons.delete_outline,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Text(
                "•••• •••• •••• ${card.lastFourDigits}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  letterSpacing: 1.2,
                ),
              ),
              if (card.isExpired) ...[
                const SizedBox(height: 8),
                const Text(
                  "Срок годности истек",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFDF291D), 
                    
                  ),
                ),
              ]
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.credit_card,
              size: 40,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Пока что пусто",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        height: 56, 
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Нажата кнопка добавления")),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFDF291D), 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
          child: const Text(
            "+ Добавить",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}