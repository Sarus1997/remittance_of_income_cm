// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Remark extends StatefulWidget {
  final TextEditingController RefundController;
  final TextEditingController NetController;
  final TextEditingController RemarkController1;
  final TextEditingController RemarkController2;
  final TextEditingController RemarkController3;
  final TextEditingController RemarkController4;
  final TextEditingController RemarkController5;

  const Remark({
    required this.RefundController,
    required this.NetController,
    required this.RemarkController1,
    required this.RemarkController2,
    required this.RemarkController3,
    required this.RemarkController4,
    required this.RemarkController5,
    super.key,
  });

  @override
  _RemarkState createState() => _RemarkState();
}

final FocusNode _remark2FocusNode = FocusNode();
final FocusNode _remark3FocusNode = FocusNode();
final FocusNode _remark4FocusNode = FocusNode();
final FocusNode _remark5FocusNode = FocusNode();

class _RemarkState extends State<Remark> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRow1(),
        _buildRow2(),
        const SizedBox(height: 10),
        _buildRemarkRow(),
        _buildRemark2Row(),
        _buildRemark3Row(),
        _buildRemark4Row(),
        _buildRemark5Row(),
      ],
    );
  }

  Widget _buildRow1() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            height: 30,
            padding: const EdgeInsets.all(4),
            child: const Text(
              "หักรับคืนคูปอง/Refund",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 30,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: SizedBox(
              child: TextField(
                controller: widget.RefundController,
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

  Widget _buildRow2() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            height: 30,
            padding: const EdgeInsets.all(4),
            child: const Text(
              "รวมรายได้สุทธิ/Net Amount",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 30,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: SizedBox(
              child: TextField(
                controller: widget.NetController,
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

  Widget _buildRemarkRow() {
    return Row(
      children: [
        const Expanded(
          child: SizedBox(
            height: 30,
            child: Text(
              "หมายเหตุ/Remark",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              SizedBox(
                height: 20,
                child: TextField(
                  controller: widget.RemarkController1,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    contentPadding: EdgeInsets.only(bottom: 22),
                  ),
                  style: const TextStyle(fontSize: 10),
                  onChanged: (value) {
                    if (value.length >= 65) {
                      widget.RemarkController1.selection =
                          TextSelection.fromPosition(
                              const TextPosition(offset: 65));
                      FocusScope.of(context).requestFocus(_remark2FocusNode);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRemark2Row() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              SizedBox(
                height: 20,
                child: TextField(
                  controller: widget.RemarkController2,
                  focusNode: _remark2FocusNode,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    contentPadding: EdgeInsets.only(bottom: 22),
                  ),
                  style: const TextStyle(fontSize: 10),
                  onChanged: (value) {
                    if (value.length >= 75) {
                      widget.RemarkController2.selection =
                          TextSelection.fromPosition(
                              const TextPosition(offset: 75));
                      FocusScope.of(context).requestFocus(_remark3FocusNode);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRemark3Row() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              SizedBox(
                height: 20,
                child: TextField(
                  controller: widget.RemarkController3,
                  focusNode: _remark3FocusNode,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    contentPadding: EdgeInsets.only(bottom: 22),
                  ),
                  style: const TextStyle(fontSize: 10),
                  onChanged: (value) {
                    if (value.length >= 75) {
                      widget.RemarkController2.selection =
                          TextSelection.fromPosition(
                              const TextPosition(offset: 75));
                      FocusScope.of(context).requestFocus(_remark4FocusNode);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRemark4Row() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              SizedBox(
                height: 20,
                child: TextField(
                  controller: widget.RemarkController4,
                  focusNode: _remark4FocusNode,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    contentPadding: EdgeInsets.only(bottom: 22),
                  ),
                  style: const TextStyle(fontSize: 10),
                  onChanged: (value) {
                    if (value.length >= 75) {
                      widget.RemarkController2.selection =
                          TextSelection.fromPosition(
                              const TextPosition(offset: 75));
                      FocusScope.of(context).requestFocus(_remark5FocusNode);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRemark5Row() {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              SizedBox(
                height: 20,
                child: TextField(
                  controller: widget.RemarkController5,
                  focusNode: _remark5FocusNode,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    contentPadding: EdgeInsets.only(bottom: 22),
                  ),
                  style: const TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
