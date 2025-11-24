class Product {
  final int id;
  final String name;
  final double price;
  final String description;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });
}

// Sepete eklenen ürünleri tutacak global liste.
final List<Product> cartItems = [];

final List<Product> mockProducts = [
  Product(
      id: 1,
      name: 'Işıltılı Fondöten',
      price: 850,
      description: 'Cildinize doğal bir parlaklık ve pürüzsüz bir görünüm kazandıran, orta kapatıcılıkta, tüm gün kalıcı likit fondöten. Cilt tonunu eşitler ve kusurları gizler.',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRl_3AIgdqVUYzd1hj-bnk6wx6tw1Ppu5ZRixXQ5XQsNvXnZlDvxvcDUanlJlGPC1ZVmHZoFODUfmhMBgjhzf5sKSUSFE7qsDy9o2FnVWtWPMOEoWHRQJefDg'),
  Product(
      id: 42,
      name: 'Hacim Veren Maskara',
      price: 475,
      description: 'Kirpiklerinize anında hacim ve dramatik bir uzunluk katan, topaklanma yapmayan özel fırçalı siyah maskara. Akma ve bulaşmaya karşı dayanıklıdır.',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTDzOU_gZvjAGXZuNKZBVCcLSaiclRvhFty-0cGkuKjYobSdSLk1jOkAA17IAKAP3hwLg4HRtWYU4HpBjtA0tmvL1xkV67HRFFADGr_cKS5EwArHUjZkOal'),
  Product(
      id: 99,
      name: 'Mat Ruj - Bordo',
      price: 520,
      description: 'Yoğun pigmentli, tek sürüşte tam kapatıcılık sağlayan, kadifemsi mat bitişli, uzun süre kalıcı bordo ruj. Dudakları kurutmaz.',
      imageUrl: 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSqgPHdpwiTGbD55yqHYZ-oX7ygY71zLFZHHdCtrI6YFJ3kQeej8i53nqgDZYjeihGIEUBY97Sc51r6A2uVK2jHzll2Q7M_aG5BPgLhqAmO8hTQUeziqeKpow'),
  Product(
      id: 101,
      name: 'Far Paleti - Toprak Tonları',
      price: 1250,
      description: 'Hem mat hem de ışıltılı 12 farklı toprak tonu içeren far paleti. Yüksek pigmentasyonu ile kolayca karışır ve gün boyu kalıcılığını korur.',
      imageUrl: 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTxc3UaXvaV4if2pKAu8D_FZBgSTcK45tbb4YKRl3mAztBD2pZ9J87NJjEQv8IiN-3VKlqbd_JAaO5kALIeRFVpoHv6DNWnbH0gC4B19yHRfp-IiVnLQ1kbtw'),
];