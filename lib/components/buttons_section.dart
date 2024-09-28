// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
      "Fccoin_tot": "",
      "Eshop_tot": "",
      "Voucher_tot": "",
      "Cheque_tot": "",
      "Payin_tot": "",
      "Tax_tot": "",
      "Gift_tot": "",
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

    try {
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Income Report',
                    style: const pw.TextStyle(fontSize: 24)),
                pw.SizedBox(height: 16),
                pw.Text('Date: ${dateController.text}'),
                pw.Text('Staff ID: ${staffIdController.text}'),
                pw.Text('Name: ${nameController.text}'),
                pw.Text('Dept: ${deptController.text}'),
                pw.Text('Location: ${locationController.text}'),
                pw.SizedBox(height: 16),
                pw.Row(
                  children: [
                    pw.Expanded(
                      flex: 1,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            'USD: ${usdController.text} x ${usdRateController.text} = ${double.parse(usdController.text) * double.parse(usdRateController.text)}',
                          ),
                          pw.Text(
                            'SGD: ${sgdController.text} x ${sgdRateController.text} = ${double.parse(sgdController.text) * double.parse(sgdRateController.text)}',
                          ),
                          pw.SizedBox(height: 16),
                          pw.Text('Total: $total'),
                        ],
                      ),
                    ),
                    pw.SizedBox(width: 10),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            'USD: ${usdController.text} x ${usdRateController.text} = ${double.parse(usdController.text) * double.parse(usdRateController.text)}',
                          ),
                          pw.Text(
                            'SGD: ${sgdController.text} x ${sgdRateController.text} = ${double.parse(sgdController.text) * double.parse(sgdRateController.text)}',
                          ),
                          pw.SizedBox(height: 16),
                          pw.Text('Total: $total'),
                        ],
                      ),
                    ),
                    pw.SizedBox(width: 10),
                    pw.Expanded(
                      flex: 1,
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            'USD: ${usdController.text} x ${usdRateController.text} = ${double.parse(usdController.text) * double.parse(usdRateController.text)}',
                          ),
                          pw.Text(
                            'SGD: ${sgdController.text} x ${sgdRateController.text} = ${double.parse(sgdController.text) * double.parse(sgdRateController.text)}',
                          ),
                          pw.SizedBox(height: 16),
                          pw.Text('Total: $total'),
                        ],
                      ),
                    ),
                    pw.Text('creditController: ${creditController.text}'),
                  ],
                ),
              ],
            );
          },
        ),
      );

      await Printing.layoutPdf(
          onLayout: (PdfPageFormat format) async => pdf.save());
    } catch (e) {
      if (kDebugMode) {
        print('Error generating PDF: $e');
      }
    }
  }
}
