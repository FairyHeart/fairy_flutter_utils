///正则表达式工具类
///
///another Fairy

class RegexUtil {
  /// 简单11位手机号验证
  static final String regexMobileSimple = '^[1]\\d{10}\$';

  /// 电话号码正则表达式
  static final String regexTel = '^0\\d{2,3}[- ]?\\d{7,8}';

  /// 身份证号码的正则表达式，长度为15
  static final String regexIdCard15 =
      '^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}\$';

  /// 身份证号码的正则表达式，长度为18
  static final String regexIdCard18 =
      '^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9Xx])\$';

  /// 电子邮件正则表达式
  static final String regexEmail =
      '^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$';

  /// url的正则表达式
  static final String regexUrl = '[a-zA-Z]+://[^\\s]*';

  /// 汉字正则表达式
  static final String regexZh = '[\\u4e00-\\u9fa5]';

  /// 格式为“yyyy-MM-dd”的日期正则表达式
  static final String regexDate =
      '^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)\$';

  /// ip地址的正则表达式。
  static final String regexIp =
      '((2[0-4]\\d|25[0-5]|[01]?\\d\\d?)\\.){3}(2[0-4]\\d|25[0-5]|[01]?\\d\\d?)';

  /// 必须包含字母和数字,不能包含特色字符, 6~18.
  static const String regexPwd =
      '^(?![0-9]+\$)(?![a-zA-Z]+\$)[0-9A-Za-z]{6,18}\$';

  /// 必须包含字母和数字,可包含特殊字符 6~18.
  static const String regexPwdOrSpecial =
      '^(?![0-9]+\$)(?![a-zA-Z]+\$)[0-9A-Za-z\\W]{6,18}\$';

  /// 必须包含字母和数字和特殊字符, 6~18.
  static const String regexPwdAndSpecial =
      '^(?![0-9]+\$)(?![a-zA-Z]+\$)(?![0-9a-zA-Z]+\$)(?![0-9\\W]+\$)(?![a-zA-Z\\W]+\$)[0-9A-Za-z\\W]{6,18}\$';

  RegexUtil._();

  /// 是否手机号
  static bool isMobileSimple(String? mobile) {
    return matches(regexMobileSimple, mobile);
  }

  /// 是否电话号码
  static bool isTel(String? tel) {
    return matches(regexTel, tel);
  }

  /// 是否长度为15位的身份证号码
  static bool isIDCard15(String? cardNo) {
    return matches(regexIdCard15, cardNo);
  }

  /// 是否长度为18位的身份证号码
  static bool isIDCard18(String? cardNo) {
    return matches(regexIdCard18, cardNo);
  }

  /// 是否邮箱地址
  static bool isEmail(String? email) {
    return matches(regexEmail, email);
  }

  /// 是否url地址
  static bool isURL(String? url) {
    return matches(regexUrl, url);
  }

  /// 是否包含汉字
  static bool isZh(String? zh) {
    return '〇' == zh || matches(regexZh, zh);
  }

  /// 是否格式为“yyyy-MM-dd”的日期
  static bool isDate(String? date) {
    return matches(regexDate, date);
  }

  /// 是否ip地址
  static bool isIP(String? ip) {
    return matches(regexIp, ip);
  }

  /// 必须包含字母和数字, 6~18
  static bool isPassword(String? password, {String regex = regexPwd}) {
    return matches(regex, password);
  }

  ///正则匹配
  static bool matches(String regex, String? input) {
    if (input == null || input.isEmpty) return false;
    return RegExp(regex).hasMatch(input);
  }
}
