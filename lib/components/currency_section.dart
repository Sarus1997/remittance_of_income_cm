import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrencySection extends StatelessWidget {
  final TextEditingController usdController;
  final TextEditingController sgdController;
  final TextEditingController usdRateController;
  final TextEditingController sgdRateController;
  final TextEditingController twdController;
  final TextEditingController twdRateController;
  final TextEditingController jpyController;
  final TextEditingController jpyRateController;
  final TextEditingController hkdController;
  final TextEditingController hkdRateController;
  final TextEditingController gbpController;
  final TextEditingController gbpRateController;
  final TextEditingController cnyController;
  final TextEditingController cnyRateController;
  final TextEditingController audController;
  final TextEditingController audRateController;
  final TextEditingController eurController;
  final TextEditingController eurRateController;
  final TextEditingController totalCurrencyController;
  final double usdResult;
  final double sgdResult;
  final double twdResult;
  final double jpyResult;
  final double hkdResult;
  final double gbpResult;
  final double cnyResult;
  final double audResult;
  final double eurResult;
  final double totalCurrency;

  // past 2
  final double cashTotal;
  final TextEditingController cashController;

  const CurrencySection({
    required this.usdController,
    required this.sgdController,
    required this.usdRateController,
    required this.sgdRateController,
    required this.twdController,
    required this.twdRateController,
    required this.jpyController,
    required this.jpyRateController,
    required this.hkdController,
    required this.hkdRateController,
    required this.gbpController,
    required this.gbpRateController,
    required this.cnyController,
    required this.cnyRateController,
    required this.audController,
    required this.audRateController,
    required this.eurController,
    required this.eurRateController,
    required this.usdResult,
    required this.sgdResult,
    required this.twdResult,
    required this.jpyResult,
    required this.hkdResult,
    required this.gbpResult,
    required this.cnyResult,
    required this.audResult,
    required this.eurResult,
    required this.totalCurrency,
    required this.cashTotal,
    required this.cashController,
    required this.totalCurrencyController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTopRow(),
        _buildMidRow(),
        _buildCurrencyRow('USD', usdController, usdRateController, usdResult),
        _buildCurrencyRow('SGD', sgdController, sgdRateController, sgdResult),
        _buildCurrencyRow('TWD', twdController, twdRateController, twdResult),
        _buildCurrencyRow('JPY', jpyController, jpyRateController, jpyResult),
        _buildCurrencyRow('HKD', hkdController, hkdRateController, hkdResult),
        _buildCurrencyRow('GBP', gbpController, gbpRateController, gbpResult),
        _buildCurrencyRow('CNY', cnyController, cnyRateController, cnyResult),
        _buildCurrencyRow('AUD', audController, audRateController, audResult),
        _buildCurrencyRow('EUR', eurController, eurRateController, eurResult),
        _buildTotalRow(totalCurrency),
        _buildTextRow(),
        _buildCashRow(cashTotal),
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
          'เงินสกุลต่างประเทศ\nForeign Currency',
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
              'จำนวน X มูลค่า\nQuantity X Rate',
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

  Widget _buildCurrencyRow(String currency, TextEditingController controller,
      TextEditingController rateController, double result) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      currency,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: 20,
                    child: TextField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontSize: 10),
                      decoration: const InputDecoration(
                        hintText: 'Quantity',
                        hintStyle: TextStyle(fontSize: 10),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                const Text('x'),
                const SizedBox(width: 4),
                Flexible(
                  child: SizedBox(
                    height: 20,
                    child: TextField(
                      controller: rateController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 10),
                      decoration: const InputDecoration(
                        hintText: 'Rate',
                        hintStyle: TextStyle(fontSize: 10),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 30,
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

  Widget _buildTotalRow(double total) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: const Text(
              '(4)รวม/Total',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 28,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: TextField(
              controller: totalCurrencyController,
              decoration: InputDecoration(
                hintText: ' ${NumberFormat('#,##0.00').format(total)}',
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
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

  Widget _buildTextRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: const Text(
              'รายได้รอบ1/Amount (First Collection)',
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCashRow(double cashTotal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: const Text(
              '(5)เงินสด/Cash',
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
            child: SizedBox(
              height: 26,
              child: TextField(
                controller: cashController,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
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
}
