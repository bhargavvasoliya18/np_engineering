import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:np_engineering/common_widget/common_widget.dart';
import 'package:np_engineering/common_widget/custom_button.dart';
import 'package:np_engineering/model/expense_model.dart';
import 'package:np_engineering/screen/my_expenses_screen/my_expenses_bloc.dart';
import 'package:np_engineering/screen/my_expenses_screen/my_expenses_event.dart';
import 'package:np_engineering/utils/responsive.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({Key? key}) : super(key: key);

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _expAmountController = TextEditingController();

  final List<String> _uploadedFiles = [];

  @override
  void dispose() {
    _fullNameController.dispose();
    _expAmountController.dispose();
    super.dispose();
  }

  void _addFile() {
    // Simulate file picker - In real app, use file_picker package
    setState(() {
      _uploadedFiles.add('Report_name_${_uploadedFiles.length + 1}.pdf');
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('File uploaded successfully'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _removeFile(int index) {
    setState(() {
      _uploadedFiles.removeAt(index);
    });
  }

  void _submitExpense() {
    if (_formKey.currentState!.validate()) {
      final expense = Expense(
        title: _fullNameController.text,
        date: DateTime.now().toString().split(' ')[0],
        amount: '\$${_expAmountController.text}',
        status: 'Pending',
      );

      context.read<ExpenseBloc>().add(AddExpenseEvent(expense: expense));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Expense added successfully'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomColumn(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            CustomContainer(
              padding: ResponsiveUtil.getResponsivePadding(
                context,
                const EdgeInsets.all(20),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: const Color(0xFF007AFF).withOpacity(0.2),
                    width: 2,
                  ),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Text(
                'Details',
                style: TextStyle(
                  fontSize: ResponsiveUtil.getResponsiveFontSize(context, 20),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            // Form Content
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: CustomContainer(
                    padding: ResponsiveUtil.getResponsivePadding(
                      context,
                      const EdgeInsets.all(20),
                    ),
                    child: CustomColumn(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Full Name Field
                        Text(
                          'Full Name',
                          style: TextStyle(
                            fontSize: ResponsiveUtil.getResponsiveFontSize(context, 14),
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _fullNameController,
                          decoration: InputDecoration(
                            hintText: '',
                            filled: true,
                            fillColor: Colors.grey[50],
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Color(0xFFE5E5EA)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Color(0xFFE5E5EA)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Color(0xFF007AFF), width: 2),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter full name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: ResponsiveUtil.getResponsiveHeight(context, 20)),
                        Text(
                          'Exp. Amount',
                          style: TextStyle(
                            fontSize: ResponsiveUtil.getResponsiveFontSize(context, 14),
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _expAmountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '',
                            filled: true,
                            fillColor: Colors.grey[50],
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Color(0xFFE5E5EA)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Color(0xFFE5E5EA)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Color(0xFF007AFF), width: 2),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter amount';
                            }
                            if (double.tryParse(value) == null) {
                              return 'Please enter valid amount';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: ResponsiveUtil.getResponsiveHeight(context, 20)),
                        // Divider
                        CustomContainer(
                          height: 1,
                          color: const Color(0xFF007AFF).withOpacity(0.2),
                        ),
                        SizedBox(height: ResponsiveUtil.getResponsiveHeight(context, 20)),

                        // File Upload Section
                        Text(
                          'File Upload',
                          style: TextStyle(
                            fontSize: ResponsiveUtil.getResponsiveFontSize(context, 14),
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: ResponsiveUtil.getResponsiveHeight(context, 16)),

                        // Drag and Drop Area
                        GestureDetector(
                          onTap: _addFile,
                          child: CustomContainer(
                            padding: const EdgeInsets.all(40),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey[300]!,
                                width: 2,
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: CustomColumn(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.cloud_upload_outlined,
                                  size: ResponsiveUtil.getResponsiveFontSize(context, 40),
                                  color: Colors.grey[400],
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Drag and drop your files',
                                  style: TextStyle(
                                    fontSize: ResponsiveUtil.getResponsiveFontSize(context, 14),
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'JPEG, PNG and PDF, file size no more than 10MB',
                                  style: TextStyle(
                                    fontSize: ResponsiveUtil.getResponsiveFontSize(context, 11),
                                    color: Colors.grey[400],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                CustomContainer(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey[300]!),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    'Browse File',
                                    style: TextStyle(
                                      fontSize: ResponsiveUtil.getResponsiveFontSize(context, 13),
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: ResponsiveUtil.getResponsiveHeight(context, 16)),

                        // Uploaded Files List
                        if (_uploadedFiles.isNotEmpty) ...[
                          Text(
                            'Uploaded Files',
                            style: TextStyle(
                              fontSize: ResponsiveUtil.getResponsiveFontSize(context, 13),
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 12),
                          ..._uploadedFiles.asMap().entries.map((entry) {
                            return CustomContainer(
                              margin: const EdgeInsets.only(bottom: 8),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey[50],
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey[200]!),
                              ),
                              child: CustomRow(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomRow(
                                    children: [
                                      Icon(
                                        Icons.description_outlined,
                                        size: 20,
                                        color: Colors.grey[600],
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        entry.value,
                                        style: TextStyle(
                                          fontSize: ResponsiveUtil.getResponsiveFontSize(
                                              context, 13),
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                    onPressed: () => _removeFile(entry.key),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Bottom Buttons
            CustomContainer(
              padding: ResponsiveUtil.getResponsivePadding(
                context,
                const EdgeInsets.all(20),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: CustomRow(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'ADD',
                      onPressed: _submitExpense,
                      backgroundColor: const Color(0xFF007AFF),
                      height: ResponsiveUtil.getResponsiveHeight(context, 50),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomButton(
                      text: 'Cancel',
                      onPressed: () => Navigator.pop(context),
                      backgroundColor: Colors.grey[200],
                      textColor: Colors.black87,
                      height: ResponsiveUtil.getResponsiveHeight(context, 50),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}