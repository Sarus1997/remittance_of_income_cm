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

  ButtonsSection({
    required this.dateController,
    required this.staffIdController,
    required this.nameController,
    required this.deptController,
    required this.locationController,
    required this.creditController,
    required this.usdController,
    required this.sgdController,
    required this.usdRateController,
    required this.sgdRateController,
    required this.twdRateController,
    required this.jpyRateController,
    required this.hkdRateController,
    required this.gbpRateController,
    required this.cnyRateController,
    required this.twdController,
    required this.jpyController,
    required this.hkdController,
    required this.gbpController,
    required this.cnyController,
    required this.audController,
    required this.eurController,
    required this.audRateController,
    required this.eurRateController,
    required this.usdTotalController,
    required this.total,
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

    // Helper function to build the credit card table
    pw.Widget buildCreditCardTable({
      required String label,
      required String amountText,
      required String total,
    }) {
      return pw.Expanded(
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              height: 20,
              width: 200,
              decoration: pw.BoxDecoration(
                border: pw.Border.all(color: PdfColors.black),
              ),
              child: pw.Text(
                label,
                style: pw.TextStyle(fontSize: 12, font: customFont),
              ),
            ),
            pw.Row(
              children: [
                // Amount text (left side)
                pw.Expanded(
                  child: pw.Container(
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black),
                    ),
                    child: pw.Text(
                      amountText,
                      style: const pw.TextStyle(fontSize: 12),
                    ),
                  ),
                ),
                // Total (right side)
                pw.Expanded(
                  child: pw.Container(
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: PdfColors.black),
                    ),
                    child: pw.Text(
                      total,
                      style: const pw.TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    try {
      double usdQuantity = _parseDouble(usdController.text);
      double usdRate = _parseDouble(usdRateController.text);
      double sgdQuantity = _parseDouble(sgdController.text);
      double sgdRate = _parseDouble(sgdRateController.text);
      double usdTotal = usdQuantity * usdRate;
      double sgdTotal = sgdQuantity * sgdRate;

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
                // Header
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'ใบนำส่งรายได้/Income Report Carnival Magic',
                      style: pw.TextStyle(fontSize: 14, font: customFont),
                    ),
                    pw.Text(
                      'รูป',
                      style: pw.TextStyle(fontSize: 14, font: customFont),
                      textAlign: pw.TextAlign.right,
                    ),
                  ],
                ),
                pw.SizedBox(height: 20),
                // Date
                pw.Text(
                  'Date: ${dateController.text}',
                  style: pw.TextStyle(font: customFont),
                ),
                pw.SizedBox(height: 10),
                // Name and Staff ID
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Name: ${nameController.text}',
                      style: pw.TextStyle(font: customFont),
                    ),
                    pw.Text(
                      'Staff ID: ${staffIdController.text}',
                      style: pw.TextStyle(font: customFont),
                    ),
                  ],
                ),
                pw.SizedBox(height: 10),
                // Dept and Location
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Dept: ${deptController.text}',
                      style: pw.TextStyle(font: customFont),
                    ),
                    pw.Text(
                      'Location: ${locationController.text}',
                      style: pw.TextStyle(font: customFont),
                    ),
                  ],
                ),
                pw.SizedBox(height: 10),

                // Credit Card Table Section
                pw.Row(
                  children: [
                    // Table 1: Credit Card
                    buildCreditCardTable(
                      label: 'บัตรเครดิต/Credit Card',
                      amountText:
                          'USD   ${usdController.text} x ${usdRateController.text}',
                      total: usdTotal.toString(),
                    ),
                    pw.SizedBox(width: 10),
                    // Table 2: Duplicate table (if needed)
                    buildCreditCardTable(
                      label: 'บัตรเครดิต/Credit Card',
                      amountText:
                          'USD   ${usdController.text} x ${usdRateController.text}',
                      total: usdTotal.toString(),
                    ),
                    pw.SizedBox(width: 10),
                    // Table 3: Another duplicate table (if needed)
                    buildCreditCardTable(
                      label: 'บัตรเครดิต/Credit Card',
                      amountText:
                          'USD   ${usdController.text} x ${usdRateController.text}',
                      total: usdTotal.toString(),
                    ),
                  ],
                ),

                pw.SizedBox(height: 16),
                // Total
                pw.Text(
                  'Total: ${(usdTotal + sgdTotal)}',
                  style: pw.TextStyle(font: customFont),
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
      return 0.0; // Return a default value if parsing fails
    }
  }
}
