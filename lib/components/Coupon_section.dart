// ignore_for_file: library_private_types_in_public_api, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Coupon extends StatefulWidget {
  final TextEditingController Coupon20_qty;
  final TextEditingController Coupon10_qty;
  final TextEditingController Coupon5_qty;
  final TextEditingController totalCoupon;

  const Coupon({
    required this.Coupon20_qty,
    required this.Coupon10_qty,
    required this.Coupon5_qty,
    required this.totalCoupon,
    super.key,
  });

  @override
  _CouponState createState() => _CouponState();
}

class _CouponState extends State<Coupon> {
  double xx20total = 0;
  double xx10total = 0;
  double xx5total = 0;
  double total = 0;

  @override
  void initState() {
    super.initState();
    widget.Coupon20_qty.addListener(_calculateTotal);
    widget.Coupon10_qty.addListener(_calculateTotal);
    widget.Coupon5_qty.addListener(_calculateTotal);
  }

  @override
  void dispose() {
    widget.Coupon20_qty.removeListener(_calculateTotal);
    widget.Coupon10_qty.removeListener(_calculateTotal);
    widget.Coupon5_qty.removeListener(_calculateTotal);
    super.dispose();
  }

  void _calculateTotal() {
    setState(() {
      xx20total = _getAmount(widget.Coupon20_qty.text, 20);
      xx10total = _getAmount(widget.Coupon10_qty.text, 10);
      xx5total = _getAmount(widget.Coupon5_qty.text, 5);
      total = xx20total + xx10total + xx5total;

      widget.totalCoupon.text = NumberFormat('#,##0.00').format(total);
    });
  }

  double _getAmount(String value, double multiplier) {
    double quantity = double.tryParse(value) ?? 0;
    return quantity * multiplier;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTopRow(),
        _buildMidRow(),
        _buildcouponRow('20      x ', widget.Coupon20_qty, xx20total),
        _buildcouponRow('10      x ', widget.Coupon10_qty, xx10total),
        _buildcouponRow('5        x ', widget.Coupon5_qty, xx5total),
        _buildTotalRow(),
      ],
    );
  }

  Widget _buildTopRow() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: const Center(
        child: Text(
          'คูปอง\nCoupon',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
              'จำนวน\nQuantity',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildcouponRow(
      String coupon, TextEditingController controller, double result) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 30,
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.black),
                bottom: BorderSide(color: Colors.black),
                left: BorderSide(color: Colors.black),
              ),
            ),
            child: Text(
              coupon,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 30,
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.black),
                bottom: BorderSide(color: Colors.black),
                right: BorderSide(color: Colors.black),
              ),
            ),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              style: const TextStyle(fontSize: 10),
              decoration: const InputDecoration(
                hintText: '0',
                hintStyle: TextStyle(fontSize: 10),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 30,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Text(
              NumberFormat('#,##0.00').format(result),
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTotalRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 30,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: const Text(
              'รวม/Total',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 30,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: widget.totalCoupon,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 12),
              ),
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              enabled: false,
            ),
          ),
        ),
      ],
    );
  }
}
