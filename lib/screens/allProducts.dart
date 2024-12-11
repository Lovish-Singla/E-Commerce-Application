import 'package:flutter/material.dart';
import 'package:ecom_fakestoreapi/models/product.dart';
import 'package:ecom_fakestoreapi/services/fakeStoreApi.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  List<Product> _products = [];
  bool _isLoading = false;
  int _limit = 20;
  int _offset = 0;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    if (_isLoading || !_hasMore) return;

    setState(() {
      _isLoading = true;
    });

    try {
      List<Product> fetchedProducts =
          await FakeStoreApi.getAllProductsWithPagination(_limit, _offset);
      setState(() {
        _products.addAll(fetchedProducts);
        _offset += _limit;
        _hasMore = fetchedProducts.length == _limit;
      });
    } catch (e) {
      // Handle error
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Products'),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
              !_isLoading) {
            _fetchProducts();
          }
          return false;
        },
        child: ListView.builder(
          itemCount: _products.length + (_hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == _products.length) {
              return Center(child: CircularProgressIndicator());
            }
            return ListTile(
              title: Text(_products[index].title),
              subtitle: Text('\$${_products[index].price}'),
            );
          },
        ),
      ),
    );
  }
}
