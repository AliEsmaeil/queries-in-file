import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

void main() async {
  final String? queries = await getInsertQuery(
      fileName:
          'C:\\Users\\alies\\OneDrive\\Desktop\\dart_application_1\\bin\\inserts.txt');

  if (queries == null) {
    print('No Data found or file not exist');
  } else {
    writeQuery(values: getValues(allQueries: queries));
  }
}

Future<String?> getInsertQuery({required String fileName}) async {
  File file = File(fileName);
  if (await file.exists()) {
    RandomAccessFile accessFile = await file.open();
    var list = utf8.decode(await accessFile.read(file.lengthSync()));
    return list;
  }
  return null;
}

List<String> getValues({required String allQueries}) {
  bool foundValue = false;
  String currentValue = "";
  List<String> valuesList = [];

  for (int i = 1; i < allQueries.length - 1; i++) {
    if (allQueries.codeUnitAt(i).compareTo('('.codeUnitAt(0)) == 0 &&
            allQueries.codeUnitAt(i + 1).compareTo('i'.codeUnitAt(0)) != 0 ||
        i == allQueries.length - 2) {
      foundValue = true;
      if (currentValue.isNotEmpty) {
        valuesList.add(currentValue);
      }
      currentValue = "";
    }
    if (allQueries.codeUnitAt(i - 1).compareTo(')'.codeUnitAt(0)) == 0) {
      foundValue = false;
    }
    if (foundValue) {
      currentValue += allQueries.substring(i, i + 1);
    }
  }
  return valuesList;
}

void writeQuery({required List<String> values}) {
  String query = 'INSERT INTO article (id, name) VALUES ';
  for (int i = 0; i < values.length; i++) {
    query += '${values[i]} ${i == values.length - 1 ? ';' : ','}';
  }
  print(query);
}
/*
 Symbol lib = Symbol('my_lib');
  Symbol cls = Symbol('Foo');
  Symbol function = Symbol('m1');

  MirrorSystem isolateMirror = currentMirrorSystem();
  LibraryMirror libMirror = isolateMirror.findLibrary(lib);

  print(
      'No of classes in ${MirrorSystem.getName(lib)} : ${libMirror.declarations.length}');

  libMirror.declarations.forEach((key, value) {
    print(key);
  });

  if (libMirror.declarations.containsKey(cls)) {
    ClassMirror clsMirror = reflectClass(Foo);
    print('members in foo class');

    clsMirror.declarations.forEach((key, value) {
      print(key);
    });

    clsMirror.invoke(function, []);
 */
