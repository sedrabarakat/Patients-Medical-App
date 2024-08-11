import 'package:hive_flutter/adapters.dart';

class HiveService{
  static Box? Auth_Box;


  static Future<void>initilized() async {
    Auth_Box = await Hive.openBox('AuthBox');

  }







}

/*// Save a string.
await HivePreference.saveData(key: 'username', value: 'JohnDoe');

// Get a string.
String? username = HivePreference.getData(key: 'username');

// Save an object.
await HivePreference.saveObject(myObject, 'myObjectKey');

// Save a list of objects.
await HivePreference.saveListOfObject(myObjectList, 'myObjectListKey');

// Get a list of strings.
List<String> myList = HivePreference.getListOfString('myListKey');

// Delete a key.
await HivePreference.delete('username');

// Clear all data.
await HivePreference.clearData();*/