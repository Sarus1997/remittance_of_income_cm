// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardSection extends StatefulWidget {
  final TextEditingController totalCreditController;
  final TextEditingController totalFCoinController;
  final TextEditingController totalOthersController;
  final TextEditingController EshopController;
  final TextEditingController VoucherController;
  final TextEditingController ChequeController;
  final TextEditingController PayinController;
  final TextEditingController TaxController;
  final TextEditingController GiftController;

  const CardSection({
    super.key,
    required this.totalCreditController,
    required this.totalFCoinController,
    required this.totalOthersController,
    required this.EshopController,
    required this.VoucherController,
    required this.ChequeController,
    required this.PayinController,
    required this.TaxController,
    required this.GiftController,
  });

  @override
  _CardSectionState createState() => _CardSectionState();
}

class _CardSectionState extends State<CardSection> {
  @override
  void initState() {
    super.initState();
    // Attach listeners to recalculate totals whenever the input changes
    widget.EshopController.addListener(_calculateTotalOthers);
    widget.VoucherController.addListener(_calculateTotalOthers);
    widget.ChequeController.addListener(_calculateTotalOthers);
    widget.PayinController.addListener(_calculateTotalOthers);
    widget.TaxController.addListener(_calculateTotalOthers);
    widget.GiftController.addListener(_calculateTotalOthers);
  }

  @override
  void dispose() {
    // Remove listeners to avoid memory leaks
    widget.EshopController.removeListener(_calculateTotalOthers);
    widget.VoucherController.removeListener(_calculateTotalOthers);
    widget.ChequeController.removeListener(_calculateTotalOthers);
    widget.PayinController.removeListener(_calculateTotalOthers);
    widget.TaxController.removeListener(_calculateTotalOthers);
    widget.GiftController.removeListener(_calculateTotalOthers);
    super.dispose();
  }

  void _calculateTotalOthers() {
    double eshop = _parseInput(widget.EshopController.text);
    double voucher = _parseInput(widget.VoucherController.text);
    double cheque = _parseInput(widget.ChequeController.text);
    double payin = _parseInput(widget.PayinController.text);
    double tax = _parseInput(widget.TaxController.text);
    double gift = _parseInput(widget.GiftController.text);

    double totalCoins = eshop + voucher + cheque + payin + tax + gift;

    widget.totalOthersController.text = totalCoins.toStringAsFixed(2);
  }

  double _parseInput(String input) {
    if (input.isEmpty) return 0.0;
    return double.tryParse(input) ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTopRow(),
        _buildTotalRow(),
        const SizedBox(height: 20),
        _buildFCoinRow(),
        _buildTotalFCoinRow(),
        const SizedBox(height: 20),
        _buildOthersRow(),
        _buildOthers2Row("E-SHOP", widget.EshopController),
        _buildOthers2Row("VOUCHER", widget.VoucherController),
        _buildOthers2Row("CHEQUE", widget.ChequeController),
        _buildOthers2Row("PAY-IN", widget.PayinController),
        _buildOthers2Row("TAX", widget.TaxController),
        _buildOthers2Row("GIFT CERTIFICATE", widget.GiftController),
        _buildTotalOthersRow(),
      ],
    );
  }

  Widget _buildTopRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: const Center(
        child: Text(
          'บัตรเครดิต\nCredit Card',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildTotalRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: const Text(
              '(1)รวม/Total',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: SizedBox(
              height: 18,
              child: TextField(
                controller: widget.totalCreditController,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  hintStyle: TextStyle(fontSize: 12),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 13),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFCoinRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: const Center(
        child: Text(
          'เอฟซีคอยน์\nFCoin',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildTotalFCoinRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: const Text(
              '(2)รวม/Total',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: SizedBox(
              height: 18,
              child: TextField(
                controller: widget.totalFCoinController,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  hintStyle: TextStyle(fontSize: 12),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOthersRow() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: const Center(
        child: Text(
          'Others',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildOthers2Row(String label, TextEditingController controller) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                label,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: '0',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTotalOthersRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: const Text(
              '(3)รวม/Total',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: SizedBox(
              child: TextField(
                controller: widget.totalOthersController,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  hintStyle: TextStyle(fontSize: 12),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
                enabled: false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
