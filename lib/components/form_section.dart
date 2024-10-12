// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FormSection extends StatefulWidget {
  final TextEditingController dateController;
  final TextEditingController staffIdController;
  final TextEditingController nameController;
  final TextEditingController deptController;
  final TextEditingController locationController;

  const FormSection({
    required this.dateController,
    required this.staffIdController,
    required this.nameController,
    required this.deptController,
    required this.locationController,
    super.key,
  });

  @override
  _FormSectionState createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  String? selectedType;
  String? selectedLocation;
  List<String> shopTypes = ['SOU', 'FB', 'RES', 'GAM'];
  List<String> locations = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRow('วันที่/Date', widget.dateController,
            isDate: true, context: context),
        Row(
          children: [
            Expanded(
                child: _buildRow('ชื่อ/Name', widget.nameController,
                    context: context)),
            const SizedBox(width: 10),
            Expanded(
                child: _buildRow(
                    'เลขประจำตัว/Staff ID No.', widget.staffIdController,
                    context: context)),
          ],
        ),
        Row(
          children: [
            Expanded(
                child: _buildRow('ฝ่าย/Dept', widget.deptController,
                    context: context)),
            const SizedBox(width: 10),
            Expanded(
              child: _buildDropdown('ประเภท/Type', shopTypes, selectedType,
                  (newValue) {
                setState(() {
                  selectedType = newValue;
                  _fetchLocations(
                      selectedType!); // Fetch locations based on selected type
                });
              }),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: _buildDropdown(
                  'จุดสร้างรายได้/Location', locations, selectedLocation,
                  (newValue) {
                setState(() {
                  selectedLocation = newValue;
                  widget.locationController.text = selectedLocation ?? '';
                });
              }),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  // Dropdown builder
  Widget _buildDropdown(String label, List<String> items, String? selectedItem,
      ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        value: selectedItem,
        items: items.isNotEmpty
            ? items.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 10),
                  ),
                );
              }).toList()
            : [],
        onChanged: onChanged,
      ),
    );
  }

  // TextField builder
  Widget _buildRow(String label, TextEditingController controller,
      {bool isDate = false, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: isDate ? () => _selectDate(context, controller) : null,
        child: AbsorbPointer(
          absorbing: isDate,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              border: const OutlineInputBorder(),
            ),
            style: const TextStyle(fontSize: 10),
          ),
        ),
      ),
    );
  }

  // Date picker
  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      controller.text = DateFormat('dd/MM/yyyy').format(pickedDate);
    }
  }

  // Fetch locations based on selected type
  Future<void> _fetchLocations(String type) async {
    final url = Uri.parse(
        'http://172.2.100.14/application/query_income_report_cm/fluttercon.php?mode=get_shop&type=$type');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        locations = data.map((item) => item['shopname'] as String).toList();
      });
    } else {
      // Handle error
      setState(() {
        locations = [];
      });
    }
  }
}
