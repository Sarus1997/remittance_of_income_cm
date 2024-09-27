// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CardSection extends StatefulWidget {
  final TextEditingController totalCardController;
  final TextEditingController totalFCoinController;
  final TextEditingController totalOthersController;
  final TextEditingController EshopController;
  final TextEditingController VoucherController;
  final TextEditingController ChequeController;
  final TextEditingController PayinController;
  final TextEditingController TaxController;
  final TextEditingController GiftController;
  final TextEditingController resultCard;

  const CardSection({
    super.key,
    required this.totalCardController,
    required this.totalFCoinController,
    required this.totalOthersController,
    required this.EshopController,
    required this.VoucherController,
    required this.ChequeController,
    required this.PayinController,
    required this.TaxController,
    required this.GiftController,
    required this.resultCard,
  });

  @override
  _CardSectionState createState() => _CardSectionState();
}

class _CardSectionState extends State<CardSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTopRow(),
        _buildTotalRow(),
        const SizedBox(height: 15),
        _buildFCoinRow(),
        _buildTotalFCoinRow(),
        const SizedBox(height: 15),
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
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                controller: widget.totalCardController,
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
                  contentPadding: EdgeInsets.symmetric(vertical: 13),
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
      padding: const EdgeInsets.symmetric(vertical: 4),
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
            padding: const EdgeInsets.all(4),
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
            height: 27,
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
                  contentPadding: EdgeInsets.symmetric(vertical: 13),
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
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: SizedBox(
              height: 18,
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
                  contentPadding: EdgeInsets.symmetric(vertical: 13),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
