///集合工具类
///
///another Fairy
class ListUtil {
  ListUtil._();

  ///集合是否为空
  static bool isEmpty(Iterable? list) {
    return list == null || list.isEmpty;
  }

  ///集合是否不为空空
  static bool isNotEmpty(Iterable? list) {
    return !isEmpty(list);
  }

  ///判断集合[listA]和集合[listB]是否相等
  static bool equalList(List? listA, List? listB) {
    if (listA == listB) return true;
    if (listA == null || listB == null) return false;
    int length = listA.length;
    if (length != listB.length) return false;
    for (int i = 0; i < length; i++) {
      if (!listA.contains(listB[i])) {
        return false;
      }
    }
    return true;
  }
}
