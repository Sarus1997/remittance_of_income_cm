// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CoinsSection extends StatefulWidget {
  final TextEditingController THB1000_qty;
  final TextEditingController THB500_qty;
  final TextEditingController THB100_qty;
  final TextEditingController THB50_qty;
  final TextEditingController THB20_qty;
  final TextEditingController THB10_qty;
  final TextEditingController THB5_qty;
  final TextEditingController THB2_qty;
  final TextEditingController THB1_qty;
  final TextEditingController THB050_qty;
  final TextEditingController THB025_qty;
  final TextEditingController totalCoinsController;

  const CoinsSection({
    required this.THB1000_qty,
    required this.THB500_qty,
    required this.THB100_qty,
    required this.THB50_qty,
    required this.THB20_qty,
    required this.THB10_qty,
    required this.THB5_qty,
    required this.THB2_qty,
    required this.THB1_qty,
    required this.THB050_qty,
    required this.THB025_qty,
    required this.totalCoinsController,
    super.key,
  });

  @override
  _CoinsSectionState createState() => _CoinsSectionState();
}

class _CoinsSectionState extends State<CoinsSection> {
  Map<double, double> results = {};

  @override
  void initState() {
    super.initState();
    _addListeners();
    _calculateInitialTotal();
  }

  void _addListeners() {
    widget.THB1000_qty.addListener(
        () => _calculateResult(1000, widget.THB1000_qty.text, 1000));
    widget.THB500_qty.addListener(
        () => _calculateResult(500, widget.THB500_qty.text, 500));
    widget.THB100_qty.addListener(
        () => _calculateResult(100, widget.THB100_qty.text, 100));
    widget.THB50_qty.addListener(
        () => _calculateResult(50, widget.THB50_qty.text, 50));
    widget.THB20_qty.addListener(
        () => _calculateResult(20, widget.THB20_qty.text, 20));
    widget.THB10_qty.addListener(
        () => _calculateResult(10, widget.THB10_qty.text, 10));
    widget.THB5_qty.addListener(
        () => _calculateResult(5, widget.THB5_qty.text, 5));
    widget.THB2_qty.addListener(
        () => _calculateResult(2, widget.THB2_qty.text, 2));
    widget.THB1_qty.addListener(
        () => _calculateResult(1, widget.THB1_qty.text, 1));
    widget.THB050_qty.addListener(
        () => _calculateResult(0.50, widget.THB050_qty.text, 0.50));
    widget.THB025_qty.addListener(
        () => _calculateResult(0.25, widget.THB025_qty.text, 0.25));
  }

  void _calculateInitialTotal() {
    double total = _calculateTotal();
    widget.totalCoinsController.text = NumberFormat('#,##0.00').format(total);
  }

  void _calculateResult(double rate, String quantity, double denomination) {
    setState(() {
      results[denomination] = rate * (double.tryParse(quantity) ?? 0);
      double totalCoins = _calculateTotal();
      widget.totalCoinsController.text =
          NumberFormat('#,##0.00').format(totalCoins);
    });
  }

  double _calculateTotal() {
    return results.values.fold(0, (sum, value) => sum + value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTopRow(),
        _buildMidRow(),
        _buildCoinsRow("1000", widget.THB1000_qty, results[1000] ?? 0),
        _buildCoinsRow("500", widget.THB500_qty, results[500] ?? 0),
        _buildCoinsRow("100", widget.THB100_qty, results[100] ?? 0),
        _buildCoinsRow("50", widget.THB50_qty, results[50] ?? 0),
        _buildCoinsRow("20", widget.THB20_qty, results[20] ?? 0),
        _buildCoinsRow("10", widget.THB10_qty, results[10] ?? 0),
        _buildCoinsRow("5", widget.THB5_qty, results[5] ?? 0),
        _buildCoinsRow("2", widget.THB2_qty, results[2] ?? 0),
        _buildCoinsRow("1", widget.THB1_qty, results[1] ?? 0),
        _buildCoinsRow("0.50", widget.THB050_qty, results[0.50] ?? 0),
        _buildCoinsRow("0.25", widget.THB025_qty, results[0.25] ?? 0),
        _buildTotalRow(),
      ],
    );
  }

  Widget _buildTopRow() {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: const Center(
        child: Text(
          'ธนาบัตรและเหรียญกษาปณ์\nNptes & Coins',
          style: TextStyle(fontSize: 10),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildMidRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: const Text(
              'ประเภท\nType',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: const Text(
              'จำนวน\nQuantity',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: const Text(
              'จำนวน\nAmount',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCoinsRow(
      String rate, TextEditingController controller, double result) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 24,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                rate,
                style:
                    const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 24,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 24,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Text(
              NumberFormat('#,##0.00').format(result),
              style: const TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTotalRow() {
    double totalCoins = _calculateTotal();

    return Row(
      children: [
        Expanded(
          child: Container(
            height: 24,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: const Text(
              '(6)รวม/Total',
              style: TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 24,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                NumberFormat('#,##0.00').format(totalCoins),
                style: const TextStyle(fontSize: 10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
