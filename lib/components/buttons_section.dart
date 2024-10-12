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

  //coupon
  final TextEditingController Coupon20_qty;
  final TextEditingController Coupon10_qty;
  final TextEditingController Coupon5_qty;
  final TextEditingController totalCoupon;
  final TextEditingController NetController;
  final TextEditingController RefundController;
  final TextEditingController RemarkController1;
  final TextEditingController RemarkController2;
  final TextEditingController RemarkController3;
  final TextEditingController RemarkController4;
  final TextEditingController RemarkController5;

  // Card controllers
  final TextEditingController totalCreditController;
  final TextEditingController totalFCoinController;
  final TextEditingController totalOthersController;
  final TextEditingController resultCard;
  final TextEditingController EshopController;
  final TextEditingController VoucherController;
  final TextEditingController ChequeController;
  final TextEditingController PayinController;
  final TextEditingController TaxController;
  final TextEditingController GiftController;

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

  const ButtonsSection({
    required this.dateController,
    required this.staffIdController,
    required this.nameController,
    required this.deptController,
    required this.locationController,
    required this.creditController,
    required this.totalCreditController,
    required this.totalFCoinController,
    required this.totalOthersController,
    required this.resultCard,
    required this.EshopController,
    required this.VoucherController,
    required this.ChequeController,
    required this.PayinController,
    required this.TaxController,
    required this.GiftController,
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
    required this.Coupon20_qty,
    required this.Coupon10_qty,
    required this.Coupon5_qty,
    required this.totalCoupon,
    required this.NetController,
    required this.RefundController,
    required this.RemarkController1,
    required this.RemarkController2,
    required this.RemarkController3,
    required this.RemarkController4,
    required this.RemarkController5,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
              const SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _saveData() async {
    // Define the base URL
    const baseUrl =
        "http://172.2.100.14/application/query_income_report_cm/fluttercon.php?mode=INSERT_DATA&type=";

    String shopType = "";

    if (locationController.text == "Souvenir") {
      shopType = "SOU";
    } else if (locationController.text == "F&B") {
      shopType = "FB";
    } else if (locationController.text == "Restaurant") {
      shopType = "RES";
    } else if (locationController.text == "Game") {
      shopType = "GAM";
    }

    String url = baseUrl + shopType;

    String idIncom = DateTime.now().millisecondsSinceEpoch.toString();
    String incomDocNo = "DOC-${DateTime.now().millisecondsSinceEpoch}";

    Map<String, dynamic> incomeData = {
      "id_incom": idIncom,
      "incom_docno": incomDocNo,
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
      "Coupon20_qty": Coupon20_qty.text,
      "Coupon10_qty": Coupon10_qty.text,
      "Coupon5_qty": Coupon5_qty.text,
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
      double totalCredit = _parseDouble(totalCreditController.text);
      double totalFCoin = _parseDouble(totalFCoinController.text);
      double eshop = _parseDouble(EshopController.text);
      double voucher = _parseDouble(VoucherController.text);
      double cheque = _parseDouble(ChequeController.text);
      double payin = _parseDouble(PayinController.text);
      double tax = _parseDouble(TaxController.text);
      double gift = _parseDouble(GiftController.text);
      double totalOthers = _parseDouble(totalOthersController.text);

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

      double NetCon = _parseDouble(NetController.text);
      double Refund = _parseDouble(RefundController.text);

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

      final double Coupon20 = (double.tryParse(Coupon20_qty.text) ?? 0.0) * 20;
      final double Coupon10 = (double.tryParse(Coupon10_qty.text) ?? 0.0) * 10;
      final double Coupon5 = (double.tryParse(Coupon5_qty.text) ?? 0.0) * 5;

      double totalCoupon = Coupon20 + Coupon10 + Coupon5;

      double total = totalCredit +
          totalFCoin +
          totalCurry +
          totalCoins2 +
          cash +
          totalOthers;

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
                    style: pw.TextStyle(fontSize: 10, font: customFont),
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
                    style: pw.TextStyle(fontSize: 10, font: customFont),
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
                  style: pw.TextStyle(fontSize: 10, font: customFont),
                ),
              ),
            ),
          ],
        );
      }

      pw.Row buildRow(String label, double amount, pw.Font customFont) {
        return pw.Row(
          children: [
            pw.SizedBox(
              width: 92,
              child: pw.Container(
                height: 20,
                alignment: pw.Alignment.centerLeft,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black),
                ),
                child: pw.Center(
                  child: pw.Text(
                    label,
                    style: pw.TextStyle(fontSize: 10, font: customFont),
                  ),
                ),
              ),
            ),
            pw.SizedBox(
              width: 91.5,
              child: pw.Container(
                height: 20,
                alignment: pw.Alignment.center,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black),
                ),
                child: pw.Center(
                  child: pw.Text(
                    NumberFormat('#,##0.00').format(amount),
                    style: pw.TextStyle(fontSize: 10, font: customFont),
                  ),
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
                    style: const pw.TextStyle(fontSize: 10),
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
                    style: const pw.TextStyle(fontSize: 10),
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
                child: pw.Center(
                  child: pw.Text(
                    NumberFormat('#,##0.00').format(result),
                    style: const pw.TextStyle(fontSize: 10),
                    textAlign: pw.TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        );
      }

      pw.Widget buildTotalRow(double totalCoins) {
        return pw.Row(
          children: [
            pw.SizedBox(
              width: 113,
              child: pw.Container(
                height: 20,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(),
                ),
                child: pw.Center(
                  child: pw.Text(
                    '(6)รวม/Total',
                    style: pw.TextStyle(fontSize: 10, font: customFont),
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
                child: pw.Center(
                  child: pw.Text(
                    NumberFormat('#,##0.00').format(totalCoins),
                    style: pw.TextStyle(fontSize: 10, font: customFont),
                  ),
                ),
              ),
            ),
          ],
        );
      }

      pw.Widget buildTopCoupon() {
        return pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          children: [
            pw.Expanded(
              child: pw.Container(
                height: 30,
                padding: const pw.EdgeInsets.all(4),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black),
                ),
                child: pw.Text(
                  'จำนวน\nQuantity',
                  style: pw.TextStyle(fontSize: 10, font: customFont),
                  textAlign: pw.TextAlign.center,
                ),
              ),
            ),
            pw.Expanded(
              child: pw.Container(
                height: 30,
                padding: const pw.EdgeInsets.all(4),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black),
                ),
                child: pw.Text(
                  'จำนวน\nAmount',
                  style: pw.TextStyle(fontSize: 10, font: customFont),
                  textAlign: pw.TextAlign.center,
                ),
              ),
            ),
          ],
        );
      }

      pw.Widget buildRowCoupon(
          String coupon, String controllerValue, double result) {
        return pw.Row(
          children: [
            pw.Expanded(
              child: pw.Container(
                height: 30,
                padding: const pw.EdgeInsets.all(4),
                decoration: const pw.BoxDecoration(
                  border: pw.Border(
                    top: pw.BorderSide(color: PdfColors.black),
                    bottom: pw.BorderSide(color: PdfColors.black),
                    left: pw.BorderSide(color: PdfColors.black),
                  ),
                ),
                child: pw.Text(
                  coupon,
                  style: const pw.TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            ),
            pw.Expanded(
              flex: 1,
              child: pw.Container(
                height: 30,
                padding: const pw.EdgeInsets.all(4),
                decoration: const pw.BoxDecoration(
                  border: pw.Border(
                    top: pw.BorderSide(color: PdfColors.black),
                    bottom: pw.BorderSide(color: PdfColors.black),
                    right: pw.BorderSide(color: PdfColors.black),
                  ),
                ),
                child: pw.Text(
                  controllerValue,
                  style: const pw.TextStyle(fontSize: 10),
                  textAlign: pw.TextAlign.center,
                ),
              ),
            ),
            pw.Expanded(
              flex: 2,
              child: pw.Container(
                height: 30,
                padding: const pw.EdgeInsets.all(4),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black),
                ),
                child: pw.Text(
                  NumberFormat('#,##0.00').format(result),
                  style: const pw.TextStyle(
                    fontSize: 10,
                  ),
                  textAlign: pw.TextAlign.center,
                ),
              ),
            ),
          ],
        );
      }

      pw.Widget buildTotalCoupon(double totalCoupon) {
        return pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          children: [
            pw.Expanded(
              child: pw.Container(
                height: 30,
                padding: const pw.EdgeInsets.all(4),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black),
                ),
                child: pw.Text(
                  'รวม/Total',
                  style: pw.TextStyle(fontSize: 10, font: customFont),
                  textAlign: pw.TextAlign.center,
                ),
              ),
            ),
            pw.Expanded(
              child: pw.Container(
                height: 30,
                padding: const pw.EdgeInsets.all(4),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black),
                ),
                child: pw.Text(
                  NumberFormat('#,##0.00').format(totalCoupon),
                  style: pw.TextStyle(
                      fontSize: 10, fontWeight: pw.FontWeight.bold),
                  textAlign: pw.TextAlign.center,
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
                        mainAxisSize: pw.MainAxisSize.min,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Container(
                            height: 30,
                            width: 200,
                            alignment: pw.Alignment.center,
                            decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black),
                            ),
                            child: pw.Text(
                              'บัตรดครดิต\nCredit Card',
                              style:
                                  pw.TextStyle(fontSize: 10, font: customFont),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          // Add currency rows in the same row
                          pw.Row(
                            children: [
                              pw.SizedBox(
                                width: 92,
                                child: pw.Container(
                                  height: 20,
                                  alignment: pw.Alignment.centerLeft,
                                  decoration: pw.BoxDecoration(
                                    border:
                                        pw.Border.all(color: PdfColors.black),
                                  ),
                                  child: pw.Container(
                                    height: 20,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(),
                                    ),
                                    child: pw.Center(
                                      child: pw.Text(
                                        '(1)รวม/Total',
                                        style: pw.TextStyle(
                                            fontSize: 10, font: customFont),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              pw.SizedBox(
                                width: 91,
                                child: pw.Container(
                                  height: 20,
                                  alignment: pw.Alignment.center,
                                  decoration: pw.BoxDecoration(
                                    border:
                                        pw.Border.all(color: PdfColors.black),
                                  ),
                                  child: pw.Container(
                                    height: 20,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(),
                                    ),
                                    child: pw.Center(
                                      child: pw.Text(
                                        NumberFormat('#,##0.00')
                                            .format(totalCredit),
                                        style: pw.TextStyle(
                                            fontSize: 10, font: customFont),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          pw.SizedBox(height: 10),
                          pw.Container(
                            height: 30,
                            width: 200,
                            alignment: pw.Alignment.center,
                            decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black),
                            ),
                            child: pw.Text(
                              'เอฟซีคอยน์\nFCoin',
                              style:
                                  pw.TextStyle(fontSize: 10, font: customFont),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          // Add currency rows in the same row
                          pw.Row(
                            children: [
                              pw.SizedBox(
                                width: 92,
                                child: pw.Container(
                                  height: 20,
                                  alignment: pw.Alignment.centerLeft,
                                  decoration: pw.BoxDecoration(
                                    border:
                                        pw.Border.all(color: PdfColors.black),
                                  ),
                                  child: pw.Container(
                                    height: 20,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(),
                                    ),
                                    child: pw.Center(
                                      child: pw.Text(
                                        '(1)รวม/Total',
                                        style: pw.TextStyle(
                                            fontSize: 10, font: customFont),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              pw.SizedBox(
                                width: 91,
                                child: pw.Container(
                                  height: 20,
                                  alignment: pw.Alignment.center,
                                  decoration: pw.BoxDecoration(
                                    border:
                                        pw.Border.all(color: PdfColors.black),
                                  ),
                                  child: pw.Container(
                                    height: 20,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(),
                                    ),
                                    child: pw.Center(
                                      child: pw.Text(
                                        NumberFormat('#,##0.00')
                                            .format(totalFCoin),
                                        style: pw.TextStyle(
                                            fontSize: 10, font: customFont),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          pw.SizedBox(height: 10),
                          pw.Container(
                            height: 30,
                            width: 200,
                            alignment: pw.Alignment.center,
                            decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black),
                            ),
                            child: pw.Text(
                              'Other',
                              style:
                                  pw.TextStyle(fontSize: 10, font: customFont),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          // Add currency rows in the same row
                          pw.Column(
                            children: [
                              buildRow('E-SHOP', eshop, customFont),
                              buildRow('VOUCHER', voucher, customFont),
                              buildRow('CHEQUE', cheque, customFont),
                              buildRow('PAY-IN', payin, customFont),
                              buildRow('TAX', tax, customFont),
                              buildRow('GIFT CARD', gift, customFont),
                              buildRow('(3)รวม/Total', totalOthers, customFont),
                            ],
                          ),
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
                            height: 30,
                            width: 200,
                            alignment: pw.Alignment.center,
                            decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black),
                            ),
                            child: pw.Text(
                              'เงินสกุลต่างประเทศ\nForeign Currency',
                              style:
                                  pw.TextStyle(fontSize: 10, font: customFont),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          pw.Row(
                            children: [
                              pw.SizedBox(
                                width: 110,
                                child: pw.Container(
                                  height: 30,
                                  alignment: pw.Alignment.center,
                                  decoration: pw.BoxDecoration(
                                    border:
                                        pw.Border.all(color: PdfColors.black),
                                  ),
                                  child: pw.Text(
                                    'จำนวน x มูลค่า\nQuantity x Rate',
                                    style: pw.TextStyle(
                                        fontSize: 10, font: customFont),
                                    textAlign: pw.TextAlign.center,
                                  ),
                                ),
                              ),
                              pw.SizedBox(
                                width: 73.5,
                                child: pw.Container(
                                  height: 30,
                                  alignment: pw.Alignment.center,
                                  decoration: pw.BoxDecoration(
                                    border:
                                        pw.Border.all(color: PdfColors.black),
                                  ),
                                  child: pw.Text(
                                    'จำนวน\nAmount',
                                    style: pw.TextStyle(
                                        fontSize: 10, font: customFont),
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
                                        fontSize: 10, font: customFont),
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
                                        fontSize: 10, font: customFont),
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
                                        fontSize: 10, font: customFont),
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
                                        fontSize: 10, font: customFont),
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
                                        fontSize: 10, font: customFont),
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
                            height: 30,
                            width: 200,
                            alignment: pw.Alignment.center,
                            decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black),
                            ),
                            child: pw.Text(
                              'ธนาบัตรและเหรียญกษาปณ์\nNote and Coin',
                              style:
                                  pw.TextStyle(fontSize: 10, font: customFont),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          pw.Row(
                            children: [
                              pw.SizedBox(
                                width: 53,
                                child: pw.Container(
                                  height: 30,
                                  alignment: pw.Alignment.center,
                                  decoration: pw.BoxDecoration(
                                    border:
                                        pw.Border.all(color: PdfColors.black),
                                  ),
                                  child: pw.Text(
                                    'ประเภท\nType',
                                    style: pw.TextStyle(
                                        fontSize: 10, font: customFont),
                                    textAlign: pw.TextAlign.center,
                                  ),
                                ),
                              ),
                              pw.SizedBox(
                                width: 60,
                                child: pw.Container(
                                  height: 30,
                                  alignment: pw.Alignment.center,
                                  decoration: pw.BoxDecoration(
                                    border:
                                        pw.Border.all(color: PdfColors.black),
                                  ),
                                  child: pw.Text(
                                    'จำนวน\nQuantity',
                                    style: pw.TextStyle(
                                        fontSize: 10, font: customFont),
                                    textAlign: pw.TextAlign.center,
                                  ),
                                ),
                              ),
                              pw.SizedBox(
                                width: 70.5,
                                child: pw.Container(
                                  height: 30,
                                  alignment: pw.Alignment.center,
                                  decoration: pw.BoxDecoration(
                                    border:
                                        pw.Border.all(color: PdfColors.black),
                                  ),
                                  child: pw.Text(
                                    'จำนวน\nAmount',
                                    style: pw.TextStyle(
                                        fontSize: 10, font: customFont),
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
                pw.Row(
                  children: [
                    pw.Expanded(
                      child: pw.SizedBox(
                        width: 200,
                        height: 20,
                        child: pw.Align(
                          alignment: pw.Alignment.centerRight,
                          child: pw.Text(
                            'รวมทั้งสิ้น/Grand Total(1)+(2)+(3)+(4)+(5)+(6) ',
                            style: pw.TextStyle(fontSize: 10, font: customFont),
                          ),
                        ),
                      ),
                    ),
                    pw.SizedBox(
                      width: 70.5,
                      child: pw.Container(
                        height: 20,
                        alignment: pw.Alignment.center,
                        decoration: pw.BoxDecoration(
                          border: pw.Border.all(color: PdfColors.black),
                        ),
                        child: pw.Container(
                          height: 20,
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(),
                          ),
                          child: pw.Center(
                            child: pw.Text(
                              NumberFormat('#,##0.00').format(total),
                              style:
                                  pw.TextStyle(fontSize: 10, font: customFont),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    // ตาราง 4
                    pw.Expanded(
                      flex: 2,
                      child: pw.Column(
                        mainAxisSize: pw.MainAxisSize.min,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(height: 10),
                          pw.Container(
                            height: 30,
                            width: 200,
                            alignment: pw.Alignment.center,
                            decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black),
                            ),
                            child: pw.Text(
                              'คูปอง\nCoupon',
                              style:
                                  pw.TextStyle(fontSize: 10, font: customFont),
                              textAlign: pw.TextAlign.center,
                            ),
                          ),
                          // Add currency rows in the same row
                          pw.Column(
                            children: [
                              buildTopCoupon(),
                              buildRowCoupon(
                                  '20 x ', Coupon20_qty.text, Coupon20),
                              buildRowCoupon(
                                  '10 x ', Coupon10_qty.text, Coupon10),
                              buildRowCoupon('5 x ', Coupon5_qty.text, Coupon5),
                              buildTotalCoupon(totalCoupon),
                            ],
                          ),
                        ],
                      ),
                    ),

                    pw.SizedBox(width: 10),

                    // ตาราง 2
                    pw.Expanded(
                      flex: 4,
                      child: pw.Column(
                        children: [
                          pw.Row(
                            children: [
                              pw.Expanded(
                                child: pw.SizedBox(
                                  width: 150,
                                  height: 20,
                                  child: pw.Align(
                                    alignment: pw.Alignment.centerRight,
                                    child: pw.Text(
                                      'หักรับคืนคูปอง/Refund ',
                                      style: pw.TextStyle(
                                          fontSize: 10, font: customFont),
                                    ),
                                  ),
                                ),
                              ),
                              pw.SizedBox(
                                width: 70.5,
                                child: pw.Container(
                                  height: 20,
                                  alignment: pw.Alignment.center,
                                  decoration: pw.BoxDecoration(
                                    border:
                                        pw.Border.all(color: PdfColors.black),
                                  ),
                                  child: pw.Container(
                                    height: 20,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(),
                                    ),
                                    child: pw.Center(
                                      child: pw.Text(
                                        NumberFormat('#,##0.00').format(Refund),
                                        style: pw.TextStyle(
                                            fontSize: 10, font: customFont),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          pw.Row(
                            children: [
                              pw.Expanded(
                                child: pw.SizedBox(
                                  width: 150,
                                  height: 20,
                                  child: pw.Align(
                                    alignment: pw.Alignment.centerRight,
                                    child: pw.Text(
                                      'รวมรายได้ได้สุทธิ/Net Amount ',
                                      style: pw.TextStyle(
                                          fontSize: 10, font: customFont),
                                    ),
                                  ),
                                ),
                              ),
                              pw.SizedBox(
                                width: 70.5,
                                child: pw.Container(
                                  height: 20,
                                  alignment: pw.Alignment.center,
                                  decoration: pw.BoxDecoration(
                                    border:
                                        pw.Border.all(color: PdfColors.black),
                                  ),
                                  child: pw.Container(
                                    height: 20,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border.all(),
                                    ),
                                    child: pw.Center(
                                      child: pw.Text(
                                        NumberFormat('#,##0.00').format(NetCon),
                                        style: pw.TextStyle(
                                            fontSize: 10, font: customFont),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          pw.SizedBox(height: 10),
                          pw.Row(
                            children: [
                              pw.Expanded(
                                flex: 1,
                                child: pw.Text(
                                  "หมายเหตุ/Remark",
                                  style: pw.TextStyle(
                                      fontSize: 9, font: customFont),
                                ),
                              ),
                              pw.SizedBox(width: 5),
                              pw.Expanded(
                                flex: 4,
                                child: pw.Container(
                                  height: 20,
                                  decoration: const pw.BoxDecoration(
                                    border: pw.Border(
                                      bottom: pw.BorderSide(width: 1),
                                    ),
                                  ),
                                  child: pw.Padding(
                                    padding: const pw.EdgeInsets.only(top: 8),
                                    child: pw.Text(
                                      RemarkController1.text,
                                      style: pw.TextStyle(
                                        fontSize: 9,
                                        font: customFont,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          pw.Row(
                            children: [
                              pw.Expanded(
                                flex: 5,
                                child: pw.Container(
                                  height: 20,
                                  decoration: const pw.BoxDecoration(
                                    border: pw.Border(
                                      bottom: pw.BorderSide(width: 1),
                                    ),
                                  ),
                                  child: pw.Padding(
                                    padding: const pw.EdgeInsets.only(top: 8),
                                    child: pw.Text(
                                      RemarkController2.text,
                                      style: pw.TextStyle(
                                        fontSize: 9,
                                        font: customFont,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          pw.Row(
                            children: [
                              pw.Expanded(
                                flex: 5,
                                child: pw.Container(
                                  height: 20,
                                  decoration: const pw.BoxDecoration(
                                    border: pw.Border(
                                      bottom: pw.BorderSide(width: 1),
                                    ),
                                  ),
                                  child: pw.Padding(
                                    padding: const pw.EdgeInsets.only(top: 8),
                                    child: pw.Text(
                                      RemarkController3.text,
                                      style: pw.TextStyle(
                                        fontSize: 9,
                                        font: customFont,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          pw.Row(
                            children: [
                              pw.Expanded(
                                flex: 5,
                                child: pw.Container(
                                  height: 20,
                                  decoration: const pw.BoxDecoration(
                                    border: pw.Border(
                                      bottom: pw.BorderSide(width: 1),
                                    ),
                                  ),
                                  child: pw.Padding(
                                    padding: const pw.EdgeInsets.only(top: 8),
                                    child: pw.Text(
                                      RemarkController4.text,
                                      style: pw.TextStyle(
                                        fontSize: 9,
                                        font: customFont,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          pw.Row(
                            children: [
                              pw.Expanded(
                                flex: 5,
                                child: pw.Container(
                                  height: 20,
                                  decoration: const pw.BoxDecoration(
                                    border: pw.Border(
                                      bottom: pw.BorderSide(width: 1),
                                    ),
                                  ),
                                  child: pw.Padding(
                                    padding: const pw.EdgeInsets.only(top: 8),
                                    child: pw.Text(
                                      RemarkController5.text,
                                      style: pw.TextStyle(
                                        fontSize: 9,
                                        font: customFont,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
