class Product {
  final String id;
  final String title;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final int? discount;
  final bool isTop;
  final double bonusAmount;
  final String characteristics;
  final String usage;
  final String storage;
  final String contraindications;
  final String manufacturer;
  List<Product> analogs; // Убрали final, чтобы можно было модифицировать

  Product({
    required this.id,
    required this.title,
    required this.price,
    this.oldPrice,
    required this.imageUrl,
    this.discount,
    this.isTop = false,
    required this.bonusAmount,
    required this.characteristics,
    required this.usage,
    required this.storage,
    required this.contraindications,
    required this.manufacturer,
    List<Product>? analogs, // Сделали nullable
  }) : analogs = analogs ?? []; // Инициализируем пустым изменяемым списком
}

// Список продуктов - добавьте ваши реальные данные сюда
class ProductData {
  static List<Product> products = [
    Product(
      id: '7',
      title: 'Цитрамон П таблетки 240 мг 10 шт',
      price: 135,
      oldPrice: 300,
      imageUrl: 'assets/images/t7.png',
      discount: 20,
      isTop: true,
      bonusAmount: 5,
      characteristics: 'Соблюдать рекомендации по применению препарата. Количество таблеток: 10 шт. Действующее вещество: парацетамол, ацетилсалициловая кислота, кофеин. Форма выпуска: таблетки. Дозировка: 240 мг.',
      usage: 'Взрослым и детям старше 15 лет по 1-2 таблетки 2-3 раза в день после еды. Максимальная суточная доза — 6 таблеток. Курс лечения не более 5-7 дней.',
      storage: 'Хранить в сухом, защищенном от света месте при температуре не выше 25°C. Хранить в недоступном для детей месте.',
      contraindications: 'Повышенная чувствительность к компонентам препарата, эрозивно-язвенные поражения ЖКТ, желудочно-кишечные кровотечения, беременность, детский возраст до 15 лет.',
      manufacturer: 'Россия, ООО "Фармстандарт"',
    ),
    Product(
      id: '1',
      title: 'Фармгрупп ООО МАГНИЙ В6-ФОРТ',
      price: 800,
      imageUrl: 'assets/images/t1.png',
      isTop: false,
      bonusAmount: 10,
      characteristics: 'Магний В6-форт - комплексный препарат для восполнения дефицита магния и витамина В6 в организме.',
      usage: 'Взрослым по 1-2 таблетки 2-3 раза в день во время еды.',
      storage: 'Хранить при температуре не выше 25°C.',
      contraindications: 'Индивидуальная непереносимость компонентов.',
      manufacturer: 'Россия, Фармгрупп ООО',
    ),
    Product(
      id: '2',
      title: 'BOTO Granat collagen 15 стиков',
      price: 3500,
      imageUrl: 'assets/images/t2.png',
      isTop: false,
      bonusAmount: 100,
      characteristics: 'Коллаген с гранатом для поддержания здоровья кожи, волос и ногтей. 15 стиков по 5г.',
      usage: 'По 1 стику в день, растворить в 200 мл воды.',
      storage: 'Хранить в сухом прохладном месте.',
      contraindications: 'Беременность, период лактации, индивидуальная непереносимость.',
      manufacturer: 'BOTO',
    ),
    Product(
      id: '3',
      title: 'Сорбифер Дурулес таблетки 100 мг 50 шт',
      price: 2600,
      imageUrl: 'assets/images/t3.png',
      isTop: false,
      bonusAmount: 80,
      characteristics: 'Препарат железа для лечения железодефицитной анемии. 50 таблеток по 100 мг.',
      usage: 'По 1-2 таблетки 1-2 раза в день за 30 минут до еды.',
      storage: 'Хранить при температуре не выше 25°C.',
      contraindications: 'Гемохроматоз, гемосидероз, язвенная болезнь желудка в стадии обострения.',
      manufacturer: 'Венгрия, EGIS',
    ),
    Product(
      id: '4',
      title: 'Энтерожермина Форте суспензия 4 млдрд/5 мл 10 шт',
      price: 4000,
      oldPrice: 5050,
      imageUrl: 'assets/images/t4.png',
      discount: 20,
      isTop: true,
      bonusAmount: 120,
      characteristics: 'Пробиотик для восстановления микрофлоры кишечника. 10 флаконов по 5 мл.',
      usage: 'По 1 флакону 2-3 раза в день во время еды.',
      storage: 'Хранить при температуре от 15°C до 25°C.',
      contraindications: 'Индивидуальная непереносимость компонентов.',
      manufacturer: 'Италия, Sanofi',
    ),
    Product(
      id: '5',
      title: 'Антисептик Akmasept спрей Aloe Vera 50 мл',
      price: 300,
      oldPrice: 505,
      imageUrl: 'assets/images/t5.png',
      discount: 20,
      isTop: false,
      bonusAmount: 5,
      characteristics: 'Антисептический спрей с алоэ вера для обработки рук и поверхностей.',
      usage: 'Распылить на руки или поверхность, дать высохнуть.',
      storage: 'Хранить при комнатной температуре, беречь от огня.',
      contraindications: 'Индивидуальная непереносимость компонентов.',
      manufacturer: 'Казахстан, Akmasept',
    ),
    Product(
      id: '6',
      title: 'Медицинские перчатки SIgma+ винил 100 шт черный M',
      price: 600,
      oldPrice: 700,
      imageUrl: 'assets/images/t6.png',
      discount: 20,
      isTop: false,
      bonusAmount: 10,
      characteristics: 'Одноразовые виниловые перчатки черного цвета, размер M, 100 штук в упаковке.',
      usage: 'Использовать для медицинских процедур и защиты рук.',
      storage: 'Хранить в сухом месте при комнатной температуре.',
      contraindications: 'Аллергия на винил.',
      manufacturer: 'Китай, Sigma+',
    ),
  ];

  static void initializeAnalogs() {
    // Цитрамон 
    products[0].analogs.addAll([products[1], products[4]]);
    
    // Магний
    products[1].analogs.addAll([products[2], products[3]]);
    
    // Коллаген 
    products[2].analogs.addAll([products[1], products[3]]);
    
    // Сорбифер 
    products[3].analogs.addAll([products[1], products[2]]);
    
    // Энтерожермина
    products[4].analogs.addAll([products[0], products[1]]);
    
    // Антисептик 
    products[5].analogs.addAll([products[6]]);
    
    // Перчатки 
    products[6].analogs.addAll([products[5]]);
  }

  static Product? getProductById(String id) {
    try {
      return products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }

  static Product? getProductByTitle(String title) {
    try {
      return products.firstWhere((product) => product.title == title);
    } catch (e) {
      return null;
    }
  }
}