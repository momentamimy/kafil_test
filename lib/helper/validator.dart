import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Validator {
  static String? emailValidation(String? value) {
    if (value!.isEmpty) {
      return "please enter the Email";
    } else if (!GetUtils.isEmail(value)) {
      return "please a valid Email";
    } else {
      return null;
    }
  }

  static String? nameValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter name";
    } else {
      if (value.characters.every((element) => element == " ")) {
        return "Name shouldn't be spaces only";
      } else if (value.characters.first == " ") {
        return "Name shouldn't  start with space";
      } else if (!validateNameREGX(value)) {
        return "Please Enter a valid Name";
      } else {
        return null;
      }
    }
  }

  static String? phoneValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter the Phone Number";
    } else if (validatePhoneEgyptREGX(value)) {
      return "Please a valid Phone Number";
    } else {
      return null;
    }
  }

  static bool validateNameREGX(String value) {
    String pattern =
        r'[!@#$%^&*(),.?":/\[/\]/\\/{}|<>;’_+=~٠١٢٣٤٥٦٧٨٩؟0123456789-]';
    RegExp regExp = new RegExp(pattern);
    RegExp regExp2 = new RegExp(r"[']");
    bool result = !regExp.hasMatch(value) && !regExp2.hasMatch(value);
    return result;
  }

  static bool validatePhoneEgyptREGX(String value) {
    String number = NumberText.replaceAllNumberIntoEnglish(value);
    String pattern = r'^01\d{9}$';
    RegExp regExp = RegExp(pattern);
    bool result = regExp.hasMatch(number);
    return result;
  }
}

class NumberText extends Object {
  static String replaceAllNumberIntoEnglish(String text) {
    try {
      String x = text
          .replaceAll("۰", "0")
          .replaceAll("۱", "1")
          .replaceAll("۲", "2")
          .replaceAll("٣", "3")
          .replaceAll("٤", "4")
          .replaceAll("٥", "5")
          .replaceAll("٦", "6")
          .replaceAll("٧", "7")
          .replaceAll("٨", "8")
          .replaceAll("۹", "9")
          .replaceAll("٠", "0")
          .replaceAll("١", "1")
          .replaceAll("٢", "2")
          .replaceAll("٣", "3")
          .replaceAll("٤", "4")
          .replaceAll("٥", "5")
          .replaceAll("٦", "6")
          .replaceAll("٧", "7")
          .replaceAll("٨", "8")
          .replaceAll("٩", "9");

      return x;
    } catch (e) {
      return text;
    }
  }
}
