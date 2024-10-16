// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, avoid_print, unnecessary_import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remittance_of_income_cm/components/Coupon_section.dart';
import 'package:remittance_of_income_cm/components/buttons_section.dart';
import 'package:remittance_of_income_cm/components/card_section.dart';
import 'package:remittance_of_income_cm/components/coins_section.dart';
import 'package:remittance_of_income_cm/components/currency_section.dart';
import 'package:remittance_of_income_cm/components/form_section.dart';
import 'package:remittance_of_income_cm/components/header_section.dart';
import 'package:intl/intl.dart';
import 'package:remittance_of_income_cm/components/remark_section.dart';

class IncomeReportPage extends StatefulWidget {
  const IncomeReportPage({super.key});

  @override
  _IncomeReportPageState createState() => _IncomeReportPageState();
}

class _IncomeReportPageState extends State<IncomeReportPage> {
  // TextEditingControllers for various inputs
  final TextEditingController _dateController = TextEditingController(text: '');
  final TextEditingController _staffIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _deptController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController creditController = TextEditingController();

  final TextEditingController usdController = TextEditingController();
  final TextEditingController sgdController = TextEditingController();
  final TextEditingController twdController = TextEditingController();
  final TextEditingController jpyController = TextEditingController();
  final TextEditingController hkdController = TextEditingController();
  final TextEditingController gbpController = TextEditingController();
  final TextEditingController cnyController = TextEditingController();
  final TextEditingController audController = TextEditingController();
  final TextEditingController eurController = TextEditingController();

  final TextEditingController usdRateController = TextEditingController();
  final TextEditingController sgdRateController = TextEditingController();
  final TextEditingController twdRateController = TextEditingController();
  final TextEditingController jpyRateController = TextEditingController();
  final TextEditingController hkdRateController = TextEditingController();
  final TextEditingController gbpRateController = TextEditingController();
  final TextEditingController cnyRateController = TextEditingController();
  final TextEditingController audRateController = TextEditingController();
  final TextEditingController eurRateController = TextEditingController();
  final TextEditingController usdTotalController = TextEditingController();
  final TextEditingController totalCurrencyController = TextEditingController();

  // Part 2 controllers
  final TextEditingController cashController = TextEditingController();

  // Card controllers
  final TextEditingController totalCreditController = TextEditingController();
  final TextEditingController totalFCoinController = TextEditingController();
  final TextEditingController totalOthersController = TextEditingController();
  final TextEditingController resultCard = TextEditingController();
  final TextEditingController EshopController = TextEditingController();
  final TextEditingController VoucherController = TextEditingController();
  final TextEditingController ChequeController = TextEditingController();
  final TextEditingController PayinController = TextEditingController();
  final TextEditingController TaxController = TextEditingController();
  final TextEditingController GiftController = TextEditingController();

  //coins controllers
  final TextEditingController totalCoinsController = TextEditingController();
  final TextEditingController THB1000_qty = TextEditingController();
  final TextEditingController THB500_qty = TextEditingController();
  final TextEditingController THB200_qty = TextEditingController();
  final TextEditingController THB100_qty = TextEditingController();
  final TextEditingController THB50_qty = TextEditingController();
  final TextEditingController THB20_qty = TextEditingController();
  final TextEditingController THB10_qty = TextEditingController();
  final TextEditingController THB5_qty = TextEditingController();
  final TextEditingController THB2_qty = TextEditingController();
  final TextEditingController THB1_qty = TextEditingController();
  final TextEditingController THB050_qty = TextEditingController();
  final TextEditingController THB025_qty = TextEditingController();
  final TextEditingController totalCoins2 = TextEditingController();

  // coupon
  final TextEditingController Coupon20_qty = TextEditingController();
  final TextEditingController Coupon10_qty = TextEditingController();
  final TextEditingController Coupon5_qty = TextEditingController();
  final TextEditingController totalCoupon = TextEditingController();
  final TextEditingController NetController = TextEditingController();
  final TextEditingController RefundController = TextEditingController();
  final TextEditingController RemarkController1 = TextEditingController();
  final TextEditingController RemarkController2 = TextEditingController();
  final TextEditingController RemarkController3 = TextEditingController();
  final TextEditingController RemarkController4 = TextEditingController();
  final TextEditingController RemarkController5 = TextEditingController();

  double totalCurrency = 0.0;
  double usdResult = 0.0;
  double sgdResult = 0.0;
  double twdResult = 0.0;
  double jpyResult = 0.0;
  double hkdResult = 0.0;
  double gbpResult = 0.0;
  double cnyResult = 0.0;
  double audResult = 0.0;
  double eurResult = 0.0;

  //card
  double totalCard = 0.0;

  //part 2
  double cashTotal = 0.0;

  //coins
  double totalCoins = 0.0;

  // Grand total variable
  double total = 0.0;

  @override
  void initState() {
    super.initState();
    usdController.addListener(_calculateResult);
    usdRateController.addListener(_calculateResult);
    sgdController.addListener(_calculateResult);
    sgdRateController.addListener(_calculateResult);
    twdController.addListener(_calculateResult);
    twdRateController.addListener(_calculateResult);
    jpyController.addListener(_calculateResult);
    jpyRateController.addListener(_calculateResult);
    hkdController.addListener(_calculateResult);
    hkdRateController.addListener(_calculateResult);
    gbpController.addListener(_calculateResult);
    gbpRateController.addListener(_calculateResult);
    cnyController.addListener(_calculateResult);
    cnyRateController.addListener(_calculateResult);
    audController.addListener(_calculateResult);
    audRateController.addListener(_calculateResult);
    eurController.addListener(_calculateResult);
    eurRateController.addListener(_calculateResult);
    resultCard.addListener(_calculateResult);

    //part 2
    cashController.addListener(_calculateResult);

    //card
    totalCreditController.addListener(_calculateResult);
    totalFCoinController.addListener(_calculateResult);
    totalOthersController.addListener(_calculateResult);

    //coins
    THB1000_qty.addListener(_calculateResult);
    THB500_qty.addListener(_calculateResult);
    THB100_qty.addListener(_calculateResult);
    THB50_qty.addListener(_calculateResult);
    THB20_qty.addListener(_calculateResult);
    THB10_qty.addListener(_calculateResult);
    THB5_qty.addListener(_calculateResult);
    THB2_qty.addListener(_calculateResult);
    THB1_qty.addListener(_calculateResult);
    THB050_qty.addListener(_calculateResult);
    THB025_qty.addListener(_calculateResult);
    totalCoinsController.addListener(_calculateResult);

    //coupon
    Coupon20_qty.addListener(_calculateResult);
    Coupon10_qty.addListener(_calculateResult);
    Coupon5_qty.addListener(_calculateResult);
    totalCoupon.addListener(_calculateResult);
  }

  void _calculateResult() {
    try {
      // Log the text values
      (' ${usdController.text}');
      (' ${usdRateController.text}');
      (' ${sgdController.text}');
      (' ${sgdRateController.text}');
      (' ${twdController.text}');
      (' ${twdRateController.text}');
      (' ${jpyController.text}');
      (' ${jpyRateController.text}');
      (' ${hkdController.text}');
      (' ${hkdRateController.text}');
      (' ${gbpController.text}');
      (' ${gbpRateController.text}');
      (' ${cnyController.text}');
      (' ${cnyRateController.text}');
      (' ${audController.text}');
      (' ${audRateController.text}');
      (' ${eurController.text}');
      (' ${eurRateController.text}');

      // Part 2
      (' ${cashController.text}');

      // Card totals
      (' ${totalCreditController.text}');
      (' ${totalFCoinController.text}');
      (' ${totalOthersController.text}');

      // Coins
      (' ${THB1000_qty.text}');
      (' ${THB500_qty.text}');
      (' ${THB100_qty.text}');
      (' ${THB50_qty.text}');
      (' ${THB20_qty.text}');
      (' ${THB10_qty.text}');
      (' ${THB5_qty.text}');
      (' ${THB2_qty.text}');
      (' ${THB1_qty.text}');
      (' ${THB050_qty.text}');
      (' ${THB025_qty.text}');

      //poupon
      (' ${Coupon20_qty.text}');
      (' ${Coupon10_qty.text}');
      (' ${Coupon5_qty.text}');
      (' ${totalCoupon.text}');

      //remark
      (' ${RefundController.text}');
      (' ${NetController.text}');
      (' ${RemarkController1.text}');

      // Existing parsing code
      final usdValue = double.tryParse(usdController.text) ?? 0.0;
      final usdRateValue = double.tryParse(usdRateController.text) ?? 0.0;
      final sgdValue = double.tryParse(sgdController.text) ?? 0.0;
      final sgdRateValue = double.tryParse(sgdRateController.text) ?? 0.0;
      final twdValue = double.tryParse(twdController.text) ?? 0.0;
      final twdRateValue = double.tryParse(twdRateController.text) ?? 0.0;
      final jpyValue = double.tryParse(jpyController.text) ?? 0.0;
      final jpyRateValue = double.tryParse(jpyRateController.text) ?? 0.0;
      final hkdValue = double.tryParse(hkdController.text) ?? 0.0;
      final hkdRateValue = double.tryParse(hkdRateController.text) ?? 0.0;
      final gbpValue = double.tryParse(gbpController.text) ?? 0.0;
      final gbpRateValue = double.tryParse(gbpRateController.text) ?? 0.0;
      final cnyValue = double.tryParse(cnyController.text) ?? 0.0;
      final cnyRateValue = double.tryParse(cnyRateController.text) ?? 0.0;
      final audValue = double.tryParse(audController.text) ?? 0.0;
      final audRateValue = double.tryParse(audRateController.text) ?? 0.0;
      final eurValue = double.tryParse(eurController.text) ?? 0.0;
      final eurRateValue = double.tryParse(eurRateController.text) ?? 0.0;

      // Part 2
      final cashValue = double.tryParse(cashController.text) ?? 0.0;

      // Card totals
      final totalCredit = double.tryParse(totalCreditController.text) ?? 0.0;
      final totalFCoin = double.tryParse(totalFCoinController.text) ?? 0.0;
      final totalOthers = double.tryParse(totalOthersController.text) ?? 0.0;

      // Coins
      final THB1000 = (double.tryParse(THB1000_qty.text) ?? 0.0) * 1000;
      final THB500 = (double.tryParse(THB500_qty.text) ?? 0.0) * 500;
      final THB100 = (double.tryParse(THB100_qty.text) ?? 0.0) * 100;
      final THB50 = (double.tryParse(THB50_qty.text) ?? 0.0) * 50;
      final THB20 = (double.tryParse(THB20_qty.text) ?? 0.0) * 20;
      final THB10 = (double.tryParse(THB10_qty.text) ?? 0.0) * 10;
      final THB5 = (double.tryParse(THB5_qty.text) ?? 0.0) * 5;
      final THB2 = (double.tryParse(THB2_qty.text) ?? 0.0) * 2;
      final THB1 = (double.tryParse(THB1_qty.text) ?? 0.0) * 1;
      final THB050 = (double.tryParse(THB050_qty.text) ?? 0.0) * 0.50;
      final THB025 = (double.tryParse(THB025_qty.text) ?? 0.0) * 0.25;

      // Calculate currency result
      usdResult = usdValue * usdRateValue;
      sgdResult = sgdValue * sgdRateValue;
      twdResult = twdValue * twdRateValue;
      jpyResult = jpyValue * jpyRateValue;
      hkdResult = hkdValue * hkdRateValue;
      gbpResult = gbpValue * gbpRateValue;
      cnyResult = cnyValue * cnyRateValue;
      audResult = audValue * audRateValue;
      eurResult = eurValue * eurRateValue;

      totalCurrency = usdResult +
          sgdResult +
          twdResult +
          jpyResult +
          hkdResult +
          gbpResult +
          cnyResult +
          audResult +
          eurResult;

      totalCoins = THB1000 +
          THB500 +
          THB100 +
          THB50 +
          THB20 +
          THB10 +
          THB5 +
          THB2 +
          THB1 +
          THB050 +
          THB025;

      // Calculate grand total
      setState(() {
        total = totalCredit +
            totalFCoin +
            totalOthers +
            totalCurrency +
            cashValue +
            totalCoins;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error parsing values: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ButtonsSection(
                    dateController: _dateController,
                    staffIdController: _staffIdController,
                    nameController: _nameController,
                    deptController: _deptController,
                    creditController: creditController,
                    locationController: _locationController,
                    usdController: usdController,
                    sgdController: sgdController,
                    totalCreditController: totalCreditController,
                    totalFCoinController: totalFCoinController,
                    totalOthersController: totalOthersController,
                    resultCard: resultCard,
                    EshopController: EshopController,
                    VoucherController: VoucherController,
                    ChequeController: ChequeController,
                    PayinController: PayinController,
                    TaxController: TaxController,
                    GiftController: GiftController,
                    usdRateController: usdRateController,
                    sgdRateController: sgdRateController,
                    twdRateController: twdRateController,
                    jpyRateController: jpyRateController,
                    hkdRateController: hkdRateController,
                    gbpRateController: gbpRateController,
                    cnyRateController: cnyRateController,
                    audRateController: audRateController,
                    eurRateController: eurRateController,
                    twdController: twdController,
                    jpyController: jpyController,
                    hkdController: hkdController,
                    gbpController: gbpController,
                    cnyController: cnyController,
                    audController: audController,
                    eurController: eurController,
                    totalCurrencyController: totalCurrencyController,
                    usdTotalController: eurRateController,
                    cashController: cashController,
                    total: totalCurrency,
                    THB1000_qty: THB1000_qty,
                    THB500_qty: THB500_qty,
                    THB100_qty: THB100_qty,
                    THB50_qty: THB50_qty,
                    THB20_qty: THB20_qty,
                    THB10_qty: THB10_qty,
                    THB5_qty: THB5_qty,
                    THB2_qty: THB2_qty,
                    THB1_qty: THB1_qty,
                    THB050_qty: THB050_qty,
                    THB025_qty: THB025_qty,
                    totalCoinsController: totalCoinsController,
                    totalCoins2: totalCoins2,
                    Coupon20_qty: Coupon20_qty,
                    Coupon10_qty: Coupon10_qty,
                    Coupon5_qty: Coupon5_qty,
                    totalCoupon: totalCoupon,
                    NetController: NetController,
                    RefundController: RefundController,
                    RemarkController1: RemarkController1,
                    RemarkController2: RemarkController2,
                    RemarkController3: RemarkController3,
                    RemarkController4: RemarkController4,
                    RemarkController5: RemarkController5,
                  ),
                  const HeaderSection(),
                  const SizedBox(height: 10),
                  FormSection(
                    dateController: _dateController,
                    staffIdController: _staffIdController,
                    nameController: _nameController,
                    deptController: _deptController,
                    locationController: _locationController,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            CardSection(
                              totalCreditController: totalCreditController,
                              totalFCoinController: totalFCoinController,
                              totalOthersController: totalOthersController,
                              EshopController: EshopController,
                              VoucherController: VoucherController,
                              ChequeController: ChequeController,
                              PayinController: PayinController,
                              TaxController: TaxController,
                              GiftController: GiftController,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            CurrencySection(
                              usdController: usdController,
                              sgdController: sgdController,
                              twdController: twdController,
                              jpyController: jpyController,
                              hkdController: hkdController,
                              gbpController: gbpController,
                              cnyController: cnyController,
                              audController: audController,
                              eurController: eurController,
                              usdRateController: usdRateController,
                              sgdRateController: sgdRateController,
                              twdRateController: twdRateController,
                              jpyRateController: jpyRateController,
                              hkdRateController: hkdRateController,
                              gbpRateController: gbpRateController,
                              cnyRateController: cnyRateController,
                              audRateController: audRateController,
                              eurRateController: eurRateController,
                              usdResult: usdResult,
                              sgdResult: sgdResult,
                              twdResult: twdResult,
                              jpyResult: jpyResult,
                              hkdResult: hkdResult,
                              gbpResult: gbpResult,
                              cnyResult: cnyResult,
                              audResult: audResult,
                              eurResult: eurResult,
                              totalCurrency: totalCurrency,

                              //part2
                              cashTotal: cashTotal,
                              cashController: cashController,
                              totalCurrencyController: totalCurrencyController,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            CoinsSection(
                              THB1000_qty: THB1000_qty,
                              THB500_qty: THB500_qty,
                              THB100_qty: THB100_qty,
                              THB50_qty: THB50_qty,
                              THB20_qty: THB20_qty,
                              THB10_qty: THB10_qty,
                              THB5_qty: THB5_qty,
                              THB2_qty: THB2_qty,
                              THB1_qty: THB1_qty,
                              THB050_qty: THB050_qty,
                              THB025_qty: THB025_qty,
                              totalCoinsController: totalCoinsController,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          height: 24,
                          padding: const EdgeInsets.all(4),
                          child: const Text(
                            "รวมทั้งสิ้น/Grand Total(1)+(2)+(3)+(4)+(5)+(6)",
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          child: Center(
                            child: _buildTotalRow(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Coupon(
                              Coupon20_qty: Coupon20_qty,
                              Coupon10_qty: Coupon10_qty,
                              Coupon5_qty: Coupon5_qty,
                              totalCoupon: totalCoupon,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            Remark(
                              RefundController: RefundController,
                              NetController: NetController,
                              RemarkController1: RemarkController1,
                              RemarkController2: RemarkController2,
                              RemarkController3: RemarkController3,
                              RemarkController4: RemarkController4,
                              RemarkController5: RemarkController5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 30,
                          child: Center(
                            child: _buildReportde(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 30,
                          child: Center(
                            child: _buildReceived(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTotalRow() {
    final NumberFormat formatter = NumberFormat('#,##0.00');
    return Container(
      height: 24,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Center(
        child: Text(
          ' ${formatter.format(total)}',
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildReportde() {
    return Column(
      children: [
        Container(
          height: 20,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: const Center(
            child: Text(
              'ผู้นำส่ง/Reportde by',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: const SizedBox(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 25),
                  Text(
                    '________________________',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '(                                             )',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '______/________/_______',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReceived() {
    return Column(
      children: [
        Container(
          height: 20,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: const Center(
            child: Text(
              'ผู้รับเงิน/Received by',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: const SizedBox(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 25),
                  Text(
                    '________________________',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '(                                             )',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '______/________/_______',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
