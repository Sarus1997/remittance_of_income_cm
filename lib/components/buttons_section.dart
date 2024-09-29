// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'dart:convert';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ButtonsSection extends StatelessWidget {
  final TextEditingController dateController;
  final TextEditingController staffIdController;
  final TextEditingController nameController;
  final TextEditingController deptController;
  final TextEditingController locationController;
  final TextEditingController creditController;
  final TextEditingController usdController;
  final TextEditingController sgdController;
  final TextEditingController twdController;
  final TextEditingController jpyController;
  final TextEditingController hkdController;
  final TextEditingController gbpController;
  final TextEditingController cnyController;
  final TextEditingController audController;
  final TextEditingController eurController;
  final TextEditingController usdRateController;
  final TextEditingController sgdRateController;
  final TextEditingController twdRateController;
  final TextEditingController jpyRateController;
  final TextEditingController hkdRateController;
  final TextEditingController gbpRateController;
  final TextEditingController cnyRateController;
  final TextEditingController audRateController;
  final TextEditingController eurRateController;
  final TextEditingController usdTotalController;
  final TextEditingController totalCurrencyController;
  final TextEditingController cashController;
  final double total;

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

  //coins
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
  final TextEditingController totalCoins2;

  ButtonsSection({
    required this.dateController,
    required this.staffIdController,
    required this.nameController,
    required this.deptController,
    required this.locationController,
    required this.creditController,
    required this.usdController,
    required this.sgdController,
    required this.twdController,
    required this.jpyController,
    required this.hkdController,
    required this.gbpController,
    required this.cnyController,
    required this.audController,
    required this.eurController,
    required this.usdRateController,
    required this.sgdRateController,
    required this.twdRateController,
    required this.jpyRateController,
    required this.hkdRateController,
    required this.gbpRateController,
    required this.cnyRateController,
    required this.audRateController,
    required this.eurRateController,
    required this.usdTotalController,
    required this.totalCurrencyController,
    required this.cashController,
    required this.total,
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
    required this.totalCoins2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              textStyle: const TextStyle(fontSize: 16),
            ),
            onPressed: () async {
              if (kDebugMode) {
                print('Save button pressed');
              }
              await _saveData();
            },
            child: const Text('บันทึก/Save'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              textStyle: const TextStyle(fontSize: 16),
            ),
            onPressed: () async {
              if (kDebugMode) {
                print('Print button pressed');
              }
              await _generateAndPrintPdf();
            },
            child: const Text('พิมพ์/Print'),
          ),
        ),
      ],
    );
  }

  Future<void> _saveData() async {
    const url =
        "http://172.2.100.14/application/query_income_report_cm/fluttercon.php?mode=INSERT_DATA&type=";

    Map<String, dynamic> incomeData = {
      "id_incom": "",
      "incom_docno": "",
      "incom_date": dateController.text,
      "usercode": staffIdController.text,
      "shopcode": locationController.text,
      "shopname": nameController.text,
      "deptcode": deptController.text,
      "Credit_tot": creditController.text,
      "Fccoin_tot": totalFCoinController.text,
      "Eshop_tot": EshopController.text,
      "Voucher_tot": VoucherController.text,
      "Cheque_tot": ChequeController.text,
      "Payin_tot": PayinController.text,
      "Tax_tot": TaxController.text,
      "Gift_tot": GiftController.text,
      "Coupon20_qty": "",
      "Coupon10_qty": "",
      "Coupon5_qty": "",
      "USD_qty": usdController.text,
      "USD_rate": usdRateController.text,
      "SGD_qty": sgdController.text,
      "SGD_rate": sgdRateController.text,
      "TWD_qty": twdController.text,
      "TWD_rate": twdRateController.text,
      "JPY_qty": jpyController.text,
      "JPY_rate": jpyRateController.text,
      "HKD_qty": hkdController.text,
      "HKD_rate": hkdRateController.text,
      "GBP_qty": gbpController.text,
      "GBP_rate": gbpRateController.text,
      "CNY_qty": cnyController.text,
      "CNY_rate": cnyRateController.text,
      "AUD_qty": audController.text,
      "AUD_rate": audRateController.text,
      "EUR_qty": eurController.text,
      "EUR_rate": eurRateController.text,
      "THB1000_qty": THB1000_qty.text,
      "THB500_qty": THB500_qty.text,
      "THB100_qty": THB100_qty.text,
      "THB50_qty": THB50_qty.text,
      "THB20_qty": THB20_qty.text,
      "THB10_qty": THB10_qty.text,
      "THB5_qty": THB5_qty.text,
      "THB2_qty": THB2_qty.text,
      "THB1_qty": THB1_qty.text,
      "THB050_qty": THB050_qty.text,
      "THB025_qty": THB025_qty.text,
      "TOTAL": total.toString(),
    };

    String jsonData = jsonEncode([incomeData]);

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonData,
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Data sent successfully!');
        }
      } else {
        if (kDebugMode) {
          print('Failed to send data. Status code: ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error sending data: $e');
      }
    }
  }

  Future<void> _generateAndPrintPdf() async {
    final pdf = pw.Document();

    // Load the custom font
    final fontData = await rootBundle.load('assets/font/pgvim.ttf');
    final customFont = pw.Font.ttf(fontData);

    try {
      // Parse inputs safely
      double usdQuantity = _parseDouble(usdController.text);
      double usdRate = _parseDouble(usdRateController.text);
      double sgdQuantity = _parseDouble(sgdController.text);
      double sgdRate = _parseDouble(sgdRateController.text);
      double twdQuantity = _parseDouble(twdController.text);
      double twdRate = _parseDouble(twdRateController.text);
      double jpyQuantity = _parseDouble(jpyController.text);
      double jpyRate = _parseDouble(jpyRateController.text);
      double hkdQuantity = _parseDouble(hkdController.text);
      double hkdRate = _parseDouble(hkdRateController.text);
      double gbpQuantity = _parseDouble(gbpController.text);
      double gbpRate = _parseDouble(gbpRateController.text);
      double cnyQuantity = _parseDouble(cnyController.text);
      double cnyRate = _parseDouble(cnyRateController.text);
      double audQuantity = _parseDouble(audController.text);
      double audRate = _parseDouble(audRateController.text);
      double eurQuantity = _parseDouble(eurController.text);
      double eurRate = _parseDouble(eurRateController.text);

      double usdTotal = usdQuantity * usdRate;
      double sgdTotal = sgdQuantity * sgdRate;
      double twdTotal = twdQuantity * twdRate;
      double jpyTotal = jpyQuantity * jpyRate;
      double hkdTotal = hkdQuantity * hkdRate;
      double gbpTotal = gbpQuantity * gbpRate;
      double cnyTotal = cnyQuantity * cnyRate;
      double audTotal = audQuantity * audRate;
      double eurTotal = eurQuantity * eurRate;

      // คำนวณผลรวมของสกุลเงินทั้งหมด
      double totalSum = usdTotal +
          sgdTotal +
          twdTotal +
          jpyTotal +
          hkdTotal +
          gbpTotal +
          cnyTotal +
          audTotal +
          eurTotal;
      totalCurrencyController.text = totalSum.toStringAsFixed(2);

      double totalCurry = _parseDouble(totalCurrencyController.text);
      double cash = _parseDouble(cashController.text);

      //coins
      final double THB1000 = (double.tryParse(THB1000_qty.text) ?? 0.0) * 1000;
      final double THB500 = (double.tryParse(THB500_qty.text) ?? 0.0) * 500;
      final double THB100 = (double.tryParse(THB100_qty.text) ?? 0.0) * 100;
      final double THB50 = (double.tryParse(THB50_qty.text) ?? 0.0) * 50;
      final double THB20 = (double.tryParse(THB20_qty.text) ?? 0.0) * 20;
      final double THB10 = (double.tryParse(THB10_qty.text) ?? 0.0) * 10;
      final double THB5 = (double.tryParse(THB5_qty.text) ?? 0.0) * 5;
      final double THB2 = (double.tryParse(THB2_qty.text) ?? 0.0) * 2;
      final double THB1 = (double.tryParse(THB1_qty.text) ?? 0.0) * 1;
      final double THB050 = (double.tryParse(THB050_qty.text) ?? 0.0) * 0.50;
      final double THB025 = (double.tryParse(THB025_qty.text) ?? 0.0) * 0.25;

// Calculate the total amount
      double totalCoins2 = THB1000 +
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

      //final totalRowWidget = buildTotalRow(totalCoins2);

      pw.Widget buildCurrencyRow(
          String currency, String amount, String rate, String total) {
        return pw.Row(
          children: [
            pw.SizedBox(
              width: 60,
              child: pw.Container(
                height: 20,
                alignment: pw.Alignment.centerLeft,
                decoration: const pw.BoxDecoration(
                  border: pw.Border(
                    left: pw.BorderSide(color: PdfColors.black),
                    top: pw.BorderSide(color: PdfColors.black),
                    bottom: pw.BorderSide(color: PdfColors.black),
                    // No right border
                  ),
                ),
                child: pw.Padding(
                  padding: const pw.EdgeInsets.only(left: 2),
                  child: pw.Text(
                    ' $currency',
                    style: pw.TextStyle(fontSize: 9, font: customFont),
                  ),
                ),
              ),
            ),
            pw.SizedBox(
              width: 50,
              child: pw.Container(
                height: 20,
                alignment: pw.Alignment.centerLeft,
                decoration: const pw.BoxDecoration(
                  border: pw.Border(
                    right: pw.BorderSide(color: PdfColors.black),
                    top: pw.BorderSide(color: PdfColors.black),
                    bottom: pw.BorderSide(color: PdfColors.black),
                    // No right border
                  ),
                ),
                child: pw.Padding(
                  padding: const pw.EdgeInsets.only(left: 2),
                  child: pw.Text(
                    '$amount x $rate',
                    style: pw.TextStyle(fontSize: 9, font: customFont),
                  ),
                ),
              ),
            ),
            pw.SizedBox(
              width: 73.5,
              child: pw.Container(
                height: 20,
                alignment: pw.Alignment.center,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black),
                ),
                child: pw.Text(
                  '  $total',
                  style: pw.TextStyle(fontSize: 9, font: customFont),
                ),
              ),
            ),
          ],
        );
      }

      pw.Widget buildCoinsRow(
        String rate,
        String total,
        String controllerValue,
        double result,
      ) {
        return pw.Row(
          children: [
            pw.SizedBox(
              width: 53,
              child: pw.Container(
                height: 20,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(),
                ),
                child: pw.Center(
                  child: pw.Text(
                    rate,
                    style: const pw.TextStyle(fontSize: 9),
                  ),
                ),
              ),
            ),
            pw.SizedBox(
              width: 60,
              child: pw.Container(
                height: 20,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(),
                ),
                child: pw.Center(
                  child: pw.Text(
                    controllerValue,
                    style: const pw.TextStyle(fontSize: 9),
                    textAlign: pw.TextAlign.center,
                  ),
                ),
              ),
            ),
            pw.SizedBox(
              width: 70.5,
              child: pw.Container(
                height: 20,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(),
                ),
                child: pw.Text(
                  NumberFormat('#,##0.00').format(result),
                  style: const pw.TextStyle(fontSize: 9),
                  textAlign: pw.TextAlign.center,
                ),
              ),
            ),
          ],
        );
      }

      pw.Widget buildTotalRow(double totalCoins) {
        return pw.Row(
          children: [
            pw.Expanded(
              child: pw.Container(
                height: 20,
                width: 120,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black),
                ),
                child: pw.Center(
                  child: pw.Text(
                    '(6)รวม/Total',
                    style: const pw.TextStyle(fontSize: 9),
                    textAlign: pw.TextAlign.center,
                  ),
                ),
              ),
            ),
            pw.Expanded(
              child: pw.Container(
                height: 20,
                width: 50,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black),
                ),
                child: pw.Center(
                  child: pw.Text(
                    NumberFormat('#,##0.00').format(totalCoins),
                    style: pw.TextStyle(fontSize: 9, font: customFont),
                  ),
                ),
              ),
            ),
          ],
        );
      }

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4.copyWith(
            marginLeft: 25,
            marginRight: 10,
            marginTop: 40,
            marginBottom: 10,
          ),
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Title row
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                      child: pw.Text(
                        'ใบนำส่งรายได้/Income Report Carnival Magic',
                        style: pw.TextStyle(fontSize: 14, font: customFont),
                      ),
                    ),
                    pw.Expanded(
                      child: pw.Text(
                        'รูป',
                        style: pw.TextStyle(fontSize: 14, font: customFont),
                        textAlign: pw.TextAlign.right,
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 20),

                // Date and Staff Info
                pw.Text('Date: ${dateController.text}',
                    style: pw.TextStyle(font: customFont)),
                pw.SizedBox(height: 10),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                      child: pw.Text('Name: ${nameController.text}',
                          style: pw.TextStyle(font: customFont)),
                    ),
                    pw.Expanded(
                      child: pw.Text('Staff ID: ${staffIdController.text}',
                          style: pw.TextStyle(font: customFont)),
                    ),
                  ],
                ),
                pw.SizedBox(height: 10),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                      child: pw.Text('Dept: ${deptController.text}',
                          style: pw.TextStyle(font: customFont)),
                    ),
                    pw.Expanded(
                      child: pw.Text('Location: ${locationController.text}',
                          style: pw.TextStyle(font: customFont)),
                    ),
                  ],
                ),
                pw.SizedBox(height: 10),

                // Currency and Credit Card Tables
                pw.Row(
                  mainAxisAlignment:
                      pw.MainAxisAlignment.start, // จัดให้อยู่ด้านบน
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    // ตาราง 1
                    pw.Expanded(
                      flex: 1,
                      child: pw.Column(
                        mainAxisSize:
                            pw.MainAxisSize.min, // จัดขนาดตามเนื้อหาภายใน
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Container(
                            height: 40,
                            width: 200,
                            alignment: pw.Alignment.center,
                            decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black),
                            ),
                            child: pw.Text(
                              'เงินสกุลต่างประเทศ\nForeign Currency',
                              style:
                                  pw.TextStyle(fontSize: 12, font: customFont),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          // Add currency rows
                          buildCurrencyRow('USD', usdController.text,
                              usdRateController.text, usdTotal.toString()),
                        ],
                      ),
                    ),
                    pw.SizedBox(width: 10),

                    // ตาราง 2
                    pw.Expanded(
                      flex: 1,
                      child: pw.Column(
                        mainAxisSize: pw.MainAxisSize.min,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Container(
                            height: 40,
                            width: 200,
                            alignment: pw.Alignment.center,
                            decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black),
                            ),
                            child: pw.Text(
                              'เงินสกุลต่างประเทศ\nForeign Currency',
                              style:
                                  pw.TextStyle(fontSize: 12, font: customFont),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          pw.Row(
                            children: [
                              pw.SizedBox(
                                width: 110,
                                child: pw.Container(
                                  height: 40,
                                  alignment: pw.Alignment.center,
                                  decoration: pw.BoxDecoration(
                                    border:
                                        pw.Border.all(color: PdfColors.black),
                                  ),
                                  child: pw.Text(
                                    'จำนวน x มูลค่า\nQuantity x Rate',
                                    style: pw.TextStyle(
                                        fontSize: 9, font: customFont),
                                    textAlign: pw.TextAlign.center,
                                  ),
                                ),
                              ),
                              pw.SizedBox(
                                width: 73.5,
                                child: pw.Container(
                                  height: 40,
                                  alignment: pw.Alignment.center,
                                  decoration: pw.BoxDecoration(
                                    border:
                                        pw.Border.all(color: PdfColors.black),
                                  ),
                                  child: pw.Text(
                                    'จำนวน\nAmount',
                                    style: pw.TextStyle(
                                        fontSize: 9, font: customFont),
                                    textAlign: pw.TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Add currency rows
                          buildCurrencyRow(
                              'USD',
                              usdController.text,
                              usdRateController.text,
                              NumberFormat('#,##0.00').format(usdTotal)),
                          buildCurrencyRow(
                              'SGD',
                              sgdController.text,
                              sgdRateController.text,
                              NumberFormat('#,##0.00').format(sgdTotal)),
                          buildCurrencyRow(
                              'TWD',
                              twdController.text,
                              twdRateController.text,
                              NumberFormat('#,##0.00').format(twdTotal)),
                          buildCurrencyRow(
                              'JPY',
                              jpyController.text,
                              jpyRateController.text,
                              NumberFormat('#,##0.00').format(jpyTotal)),
                          buildCurrencyRow(
                              'HKD',
                              hkdController.text,
                              hkdRateController.text,
                              NumberFormat('#,##0.00').format(hkdTotal)),
                          buildCurrencyRow(
                              'GBP',
                              gbpController.text,
                              gbpRateController.text,
                              NumberFormat('#,##0.00').format(gbpTotal)),
                          buildCurrencyRow(
                              'CNY',
                              cnyController.text,
                              cnyRateController.text,
                              NumberFormat('#,##0.00').format(cnyTotal)),
                          buildCurrencyRow(
                              'AUD',
                              audController.text,
                              audRateController.text,
                              NumberFormat('#,##0.00').format(audTotal)),
                          buildCurrencyRow(
                              'EUR',
                              eurController.text,
                              eurRateController.text,
                              NumberFormat('#,##0.00').format(eurTotal)),
                          pw.Row(
                            children: [
                              pw.SizedBox(
                                width: 110,
                                child: pw.Container(
                                  height: 20,
                                  alignment: pw.Alignment.center,
                                  decoration: pw.BoxDecoration(
                                    border:
                                        pw.Border.all(color: PdfColors.black),
                                  ),
                                  child: pw.Text(
                                    '(4)รวม/Total',
                                    style: pw.TextStyle(
                                        fontSize: 9, font: customFont),
                                    textAlign: pw.TextAlign.center,
                                  ),
                                ),
                              ),
                              pw.SizedBox(
                                width: 73.5,
                                child: pw.Container(
                                  height: 20,
                                  alignment: pw.Alignment.center,
                                  decoration: pw.BoxDecoration(
                                    border:
                                        pw.Border.all(color: PdfColors.black),
                                  ),
                                  child: pw.Text(
                                    NumberFormat('#,##0.00').format(totalCurry),
                                    style: pw.TextStyle(
                                        fontSize: 9, font: customFont),
                                    textAlign: pw.TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          pw.Row(
                            children: [
                              pw.SizedBox(
                                width: 183.5,
                                child: pw.Container(
                                  height: 20,
                                  alignment: pw.Alignment.center,
                                  decoration: pw.BoxDecoration(
                                    border:
                                        pw.Border.all(color: PdfColors.black),
                                  ),
                                  child: pw.Text(
                                    'รายได้รอบ1/Amount (First Collection)',
                                    style: pw.TextStyle(
                                        fontSize: 9, font: customFont),
                                    textAlign: pw.TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          pw.Row(
                            children: [
                              pw.SizedBox(
                                width: 110,
                                child: pw.Container(
                                  height: 20,
                                  alignment: pw.Alignment.center,
                                  decoration: pw.BoxDecoration(
                                    border:
                                        pw.Border.all(color: PdfColors.black),
                                  ),
                                  child: pw.Text(
                                    '(5)เงินสด/Cash',
                                    style: pw.TextStyle(
                                        fontSize: 9, font: customFont),
                                    textAlign: pw.TextAlign.center,
                                  ),
                                ),
                              ),
                              pw.SizedBox(
                                width: 73.5,
                                child: pw.Container(
                                  height: 20,
                                  alignment: pw.Alignment.center,
                                  decoration: pw.BoxDecoration(
                                    border:
                                        pw.Border.all(color: PdfColors.black),
                                  ),
                                  child: pw.Text(
                                    NumberFormat('#,##0.00').format(cash),
                                    style: pw.TextStyle(
                                        fontSize: 9, font: customFont),
                                    textAlign: pw.TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // ตาราง 3
                    pw.Expanded(
                      flex: 1,
                      child: pw.Column(
                        mainAxisSize: pw.MainAxisSize.min,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Container(
                            height: 40,
                            width: 200,
                            alignment: pw.Alignment.center,
                            decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black),
                            ),
                            child: pw.Text(
                              'เงินสกุลต่างประเทศ\nForeign Currency',
                              style:
                                  pw.TextStyle(fontSize: 12, font: customFont),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          pw.Row(
                            children: [
                              pw.SizedBox(
                                width: 53,
                                child: pw.Container(
                                  height: 40,
                                  alignment: pw.Alignment.center,
                                  decoration: pw.BoxDecoration(
                                    border:
                                        pw.Border.all(color: PdfColors.black),
                                  ),
                                  child: pw.Text(
                                    'ประเภท\nType',
                                    style: pw.TextStyle(
                                        fontSize: 9, font: customFont),
                                    textAlign: pw.TextAlign.center,
                                  ),
                                ),
                              ),
                              pw.SizedBox(
                                width: 60,
                                child: pw.Container(
                                  height: 40,
                                  alignment: pw.Alignment.center,
                                  decoration: pw.BoxDecoration(
                                    border:
                                        pw.Border.all(color: PdfColors.black),
                                  ),
                                  child: pw.Text(
                                    'จำนวน\nQuantity',
                                    style: pw.TextStyle(
                                        fontSize: 9, font: customFont),
                                    textAlign: pw.TextAlign.center,
                                  ),
                                ),
                              ),
                              pw.SizedBox(
                                width: 70.5,
                                child: pw.Container(
                                  height: 40,
                                  alignment: pw.Alignment.center,
                                  decoration: pw.BoxDecoration(
                                    border:
                                        pw.Border.all(color: PdfColors.black),
                                  ),
                                  child: pw.Text(
                                    'จำนวน\nAmount',
                                    style: pw.TextStyle(
                                        fontSize: 9, font: customFont),
                                    textAlign: pw.TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          buildCoinsRow('1000', THB1000_qty.text,
                              THB1000_qty.text, THB1000),
                          buildCoinsRow(
                              '500', THB500_qty.text, THB500_qty.text, THB500),
                          buildCoinsRow(
                              '100', THB100_qty.text, THB100_qty.text, THB100),
                          buildCoinsRow(
                              '50', THB50_qty.text, THB50_qty.text, THB50),
                          buildCoinsRow(
                              '20', THB20_qty.text, THB20_qty.text, THB20),
                          buildCoinsRow(
                              '10', THB10_qty.text, THB10_qty.text, THB10),
                          buildCoinsRow(
                              '5', THB5_qty.text, THB5_qty.text, THB5),
                          buildCoinsRow(
                              '2', THB2_qty.text, THB2_qty.text, THB2),
                          buildCoinsRow(
                              '1', THB1_qty.text, THB1_qty.text, THB1),
                          buildCoinsRow(
                              '0.50', THB050_qty.text, THB050_qty.text, THB050),
                          buildCoinsRow(
                              '0.25', THB025_qty.text, THB025_qty.text, THB025),
                          buildTotalRow(totalCoins2),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );

      // Print the PDF
      await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async => pdf.save());
    } catch (e) {
      if (kDebugMode) {
        print('Error generating PDF: $e');
      }
    }
  }

  double _parseDouble(String value) {
    try {
      return double.parse(value);
    } catch (e) {
      return 0.0;
    }
  }
}
