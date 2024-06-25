import 'dart:convert';
import 'package:ecommerce_app/src/core/widgets/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

/// The homepage screen
class CartPage extends ConsumerStatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CartPage> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  Widget build(BuildContext context) {
    
    return DetailsScreen(label: 'CartPage');
  }

}
