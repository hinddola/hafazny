mixin Validations {

  String? isValidEmail(String? email) {
    if (email!.isEmpty) {
      return "الرجاء ادخال البريد الألكتروني بشكل صحيح";
    } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return "الرجاء ادخال البريد الألكتروني";
    }
    return null;
  }

  String? isValidAge(String? content) {
    if (content!.isEmpty) {
      return "الرجاء ادخال العمو بشكل صحيح";
    } else if (int.parse(content) < 18) {return "العمر لا يجب ان يكون اقل من 18";}
    return null;
  }

  String? isValidContent(String? content) {
    if (content!.isEmpty) {
      return "الرجاء ادخال البيانات بشكل صحيح";
    }
    return null;
  }

  String? isValidPassword(String? password) {
    if (password!.isEmpty) {
      return "الرجاء ادخال كلمة المرور";
    }
    //capital letter
    else if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(password)) {
      return "كلمة المرور يجب ان تحتوي على حرف كبير واحد على الأقل";
    } else if (password.length < 8) {
      return "كلمة المرور يجب ان تكون اكثر من 8 احرف";
    }
    return null;
  }

  String? isValidConfirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword!.isEmpty) {
      return "الرجاء ادخال كلمة المرور التأكيدية";
    } else if (confirmPassword != password) {
      return "كلمة المرور غير متطابقة";
    }
    return null;
  }

  String? isValidName(String? name) {
    if (name!.isEmpty) {
      return "الرجاء ادخال الاسم";
    } else if (name.length < 2) {
      return "الاسم يجب ان يتكون من 2 احرف على الأقل";
    }
    return null;
  }

  String? isValidCode(String? code) {
    if (code!.isEmpty) {
      return "الرجاء ادخال الكود";
    } /* else if (code.length != 4) {
      return "الكود يجب ان يتكون من 4 ارقام";
    } */
    return null;
  }

  String? isValidNationalId(String? id) {
    //RegExp(r"^(?:[+0]9)?[0-9]{9}$").hasMatch(phone) &&
    if (id!.isEmpty) {
      return "الرجاء ادخال رقم الهوية";
    } else if (id.length < 11) {
      return "رقم الهوية يجب ان يتكون من 14 رقم";
    }
    return null;
  }

  String? isValidPhone(String? phone) {
    //RegExp(r"^(?:[+0]9)?[0-9]{9}$").hasMatch(phone) &&
    if (phone!.isEmpty) {
      return "الرجاء ادخال رقم الجوال";
    } else if (phone.length < 11) {
      return "رقم الجوال يجب ان يتكون من 11 رقم";
    }
    return null;
  }

  String? isValidCreditCardNumber(String? card) {
    //RegExp(r"^(?:[+0]9)?[0-9]{9}$").hasMatch(phone) &&
    if (card!.isEmpty) {
      return "الرجاء ادخال رقم الكارت";
    } else if (card.length < 11) {
      return "رقم الكارت يجب ان يتكون من 16 رقم";
    }
    return null;
  }

  String? isValidCVV(String? card) {
    //RegExp(r"^(?:[+0]9)?[0-9]{9}$").hasMatch(phone) &&
    if (card!.isEmpty) {
      return "الرجاء ادخال رقم الcvv";
    } else if (card.length < 11) {
      return "رقم الcvv يجب ان يتكون من 3 ارقام";
    }
    return null;
  }

////////////////////////////////////////////////////////////////////////////////
  String isValidEmailBloc(String email) {
    if (email.isEmpty) {
      return "الرجاء ادخال البريد الألكتروني بشكل صحيح";
    } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return "الرجاء ادخال البريد الألكتروني";
    }
    return '';
  }

  String isValidPasswordBloc(String password) {
    if (password.isEmpty) {
      return "الرجاء ادخال كلمة المرور";
    }
    //capital letter
    else if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(password)) {
      return "كلمة المرور يجب ان تحتوي على حرف كبير واحد على الأقل";
    } else if (password.length < 8) {
      return "كلمة المرور يجب ان تكون اكثر من 8 احرف";
    }
    return '';
  }

  String isValidPhoneBloc(String phone) {
    //RegExp(r"^(?:[+0]9)?[0-9]{9}$").hasMatch(phone) &&
    if (phone.isEmpty) {
      return "الرجاء ادخال رقم الجوال";
    } else if (phone.length < 11) {
      return "رقم الجوال يجب ان يتكون من 11 رقم";
    }
    return '';
  }

  String isValidConfirmPasswordBloc(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return "الرجاء ادخال كلمة المرور التأكيدية";
    } else if (confirmPassword != password) {
      return "كلمة المرور غير متطابقة";
    }
    return '';
  }

  String isValidNameBloc(String name) {
    if (name.isEmpty) {
      return "الرجاء ادخال الاسم";
    } else if (name.length < 2) {
      return "الاسم يجب ان يتكون من 2 احرف على الأقل";
    }
    return '';
  }

  String isValidCodeBloc(String code) {
    if (code.isEmpty) {
      return "الرجاء ادخال الكود";
    } /* else if (code.length != 4) {
      return "الكود يجب ان يتكون من 4 ارقام";
    } */
    return '';
  }

////////////////////////////////////////////////////////////////////////////////
}
