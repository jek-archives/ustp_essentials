import 'package:flutter/material.dart';
import '../utils/gradient_background.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  List<ProductCard> _allProducts = [
    ProductCard(
      imageUrl:
          'https://storage.googleapis.com/a1aa/image/A2aXyV6zipNVFGa5kaGiRabqPKYwsRevfdPO_59oJM0.jpg',
      category: 'Uniform',
      title: 'Female Set Uniform',
      price: '₱950.00',
    ),
    ProductCard(
      imageUrl:
          'https://storage.googleapis.com/a1aa/image/602iVC1KSU_Ce4srNF4kySgTWuROlbwinquVkFtkW40.jpg',
      category: 'Souvenir',
      title: 'Executive Jacket',
      price: '₱1180-1400',
    ),
    ProductCard(
      imageUrl:
          'https://storage.googleapis.com/a1aa/image/0sqyoUGD5ZFpsdIM-gYvI-8dIlCK1S6Xu1FtsBRNcn0.jpg',
      category: 'Uniform',
      title: 'Male Set Uniform',
      price: '₱1000.00',
    ),
    ProductCard(
      imageUrl:
          'https://storage.googleapis.com/a1aa/image/fY9oRbxmvEv0AC-M_Qr7-Vh0yFSxyUnKS2A9nHqm1Wc.jpg',
      category: 'Uniform',
      title: 'College Male Pants',
      price: '₱450.00',
    ),
  ];

  List<ProductCard> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = _allProducts;
  }

  void _filterProducts(String query) {
    setState(() {
      _filteredProducts = _allProducts
          .where((product) =>
              product.title.toLowerCase().contains(query.toLowerCase()) ||
              product.category.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.white70),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(color: Colors.white),
                      onChanged: _filterProducts,
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        print('Cart clicked');
                      },
                      child: Icon(Icons.shopping_cart, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 16),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        print('Notifications clicked');
                      },
                      child: Icon(Icons.notifications, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                padding: EdgeInsets.all(16),
                children: _filteredProducts,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String category;
  final String title;
  final String price;

  ProductCard({
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl,
                height: 100, width: double.infinity, fit: BoxFit.cover),
            SizedBox(height: 8),
            Text(category, style: TextStyle(fontSize: 12, color: Colors.grey)),
            Text(title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Text(price,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
