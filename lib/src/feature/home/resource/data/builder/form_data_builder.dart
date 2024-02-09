// ignore_for_file: must_be_immutable
import 'package:base_starter/src/core/utils/form_utils.dart';
import 'package:flutter/material.dart';

/// `FormDataBuilder` - model for form data
class FormDataBuilder {
  List<FormBuildType> textForms;
  List<FormBuildType> textAreaForms;
  List<FormBuildType> emailForms;
  List<FormBuildType> passwordForms;
  List<FormBuildType> integerForms;
  List<FormBuildType> decimalForms;
  List<FormBuildType> dateForms;
  List<FormBuildType> dateTimeForms;
  List<FormBuildType> booleanForms;

  FormDataBuilder({
    required this.textForms,
    required this.textAreaForms,
    required this.emailForms,
    required this.passwordForms,
    required this.integerForms,
    required this.decimalForms,
    required this.dateForms,
    required this.dateTimeForms,
    required this.booleanForms,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (textForms.isNotEmpty) {
      data['TEXT'] =
          textForms.map((e) => e.returnValue(FormTypeKeys.text)).toList();
    }
    if (textAreaForms.isNotEmpty) {
      data['TEXTAREA'] = textAreaForms
          .map((e) => e.returnValue(FormTypeKeys.textarea))
          .toList();
    }
    if (emailForms.isNotEmpty) {
      data['EMAIL'] =
          emailForms.map((e) => e.returnValue(FormTypeKeys.email)).toList();
    }
    if (passwordForms.isNotEmpty) {
      data['PASSWORD'] = passwordForms
          .map((e) => e.returnValue(FormTypeKeys.password))
          .toList();
    }
    if (integerForms.isNotEmpty) {
      data['INTEGER'] =
          integerForms.map((e) => e.returnValue(FormTypeKeys.integer)).toList();
    }
    if (decimalForms.isNotEmpty) {
      data['DECIMAL'] =
          decimalForms.map((e) => e.returnValue(FormTypeKeys.decimal)).toList();
    }
    if (dateForms.isNotEmpty) {
      data['DATE'] =
          dateForms.map((e) => e.returnValue(FormTypeKeys.date)).toList();
    }
    if (dateTimeForms.isNotEmpty) {
      data['DATE_TIME'] = dateTimeForms
          .map((e) => e.returnValue(FormTypeKeys.dateTime))
          .toList();
    }
    if (booleanForms.isNotEmpty) {
      data['BOOLEAN'] =
          booleanForms.map((e) => e.returnValue(FormTypeKeys.boolean)).toList();
    }

    return data;
  }

  void clear() {
    textForms.clear();
    textAreaForms.clear();
    emailForms.clear();
    passwordForms.clear();
    integerForms.clear();
    decimalForms.clear();
    dateForms.clear();
    dateTimeForms.clear();
    booleanForms.clear();
  }

  bool isEmpty() =>
      textForms.isEmpty &&
      textAreaForms.isEmpty &&
      emailForms.isEmpty &&
      passwordForms.isEmpty &&
      integerForms.isEmpty &&
      decimalForms.isEmpty &&
      dateForms.isEmpty &&
      dateTimeForms.isEmpty &&
      booleanForms.isEmpty;
}

/// `FormBuildType` - model  type for form data
class FormBuildType {
  String id;
  TextEditingController controller;
  String type;
  String label;
  bool isRequired;
  DateTime? date;

  FormBuildType({
    required this.id,
    required this.controller,
    required this.type,
    required this.label,
    required this.isRequired,
    this.date,
  });

  dynamic returnValue(String type) {
    Object? value;
    if (type == FormTypeKeys.text || type == FormTypeKeys.textarea) {
      value = controller.text;
    } else if (type == FormTypeKeys.date || type == FormTypeKeys.dateTime) {
      value = date.toString();
    }
    return value;
  }
}
