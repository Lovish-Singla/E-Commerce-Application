import 'package:flutter/material.dart';
import 'package:ecom_fakestoreapi/models/product.dart';
import 'package:ecom_fakestoreapi/services/fakeStoreApi.dart';

class CategoryProducts extends StatefulWidget {
  final String category;
  const CategoryProducts({super.key, required this.category});

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  List<Product> _products = [];
  bool _isLoading = false;
  bool _hasMore = true;
  int _limit = 10;
  int _offset = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchProducts();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !_isLoading &&
          _hasMore) {
        _fetchProducts();
      }
    });
  }

  Future<void> _fetchProducts() async {
    setState(() {
      _isLoading = true;
    });
    try {
      List<Product> fetchedProducts =
          await FakeStoreApi.getProductsByCategoryWithPagination(
              widget.category, _limit, _offset);
      setState(() {
        _products.addAll(fetchedProducts);
        _offset += _limit;
        if (fetchedProducts.length < _limit) {
          _hasMore = false;
        }
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
        title: Text(widget.category),
      ),
      body: _isLoading && _products.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              controller: _scrollController,
              itemCount: _products.length + (_hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == _products.length) {
                  return Center(child: CircularProgressIndicator());
                }
                final product = _products[index];
                return ListTile(
                  leading: Image.network(product.image),
                  title: Text(product.title),
                  subtitle: Text('\$${product.price}'),
                );
              },
            ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
