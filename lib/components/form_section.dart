import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormSection extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRow('วันที่/Date', dateController,
            isDate: true, context: context),
        Row(
          children: [
            Expanded(
                child:
                    _buildRow('ชื่อ/Name', nameController, context: context)),
            const SizedBox(width: 10),
            Expanded(
                child: _buildRow('เลขประจำตัว/Staff ID No.', staffIdController,
                    context: context)),
          ],
        ),
        Row(
          children: [
            Expanded(
                child:
                    _buildRow('ฝ่าย/Dept', deptController, context: context)),
            const SizedBox(width: 10),
            Expanded(
                child: _buildRow('จุดสร้างรายได้/Location', locationController,
                    context: context)),
          ],
        ),
      ],
    );
  }

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
          ),
        ),
      ),
    );
  }

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
}
