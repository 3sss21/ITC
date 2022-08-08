
import 'package:flutter/material.dart';

class ProductCashback extends StatelessWidget {
  const ProductCashback({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "9 баллов",
      style: TextStyle(
        fontSize: 12,
        color: Color.fromRGBO(255, 255, 255, 0.8),
      ),
    );
  }
}

class ProductCost extends StatelessWidget {
  const ProductCost({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "90 сом",
      style: TextStyle(
        fontSize: 12,
        color: Color.fromRGBO(255, 255, 255, 0.8),
      ),
    );
  }
}

class ProductName extends StatelessWidget {
  const ProductName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "товар",
      style: TextStyle(
        fontSize: 12,
        color: Color.fromRGBO(255, 255, 255, 0.8),
      ),
    );
  }
}
