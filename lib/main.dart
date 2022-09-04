// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MaterialApp(home: HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var value = TextEditingController();

  String encrypt = "there is no text  to encrypt";

  String decrypt = "there is no text  to decrypt";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 150,
              width: double.maxFinite,
              color: Colors.blue,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://cdn-userpic.codeforces.com/2293745/title/381b74ba36b06b67.jpg'),
                ),
              ),
            ),
            Text("hi how are you  1st user ?"),
          ],
        ),
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.lock_open_outlined,
              size: 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "Massages Encryption",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Icon(
              Icons.lock_outline,
              size: 25,
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: TextFormField(
                maxLines: 5,
                controller: value,
                onChanged: (value) {
                  encrypt = value;
                  decrypt = value;
                  decrypt = Decrypt(decrypt);
                  encrypt = Encrypt(encrypt);
                },
                onFieldSubmitted: (value) {
                  encrypt = value;
                  decrypt = value;
                  decrypt = Decrypt(decrypt);
                  encrypt = Encrypt(encrypt);
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.text_fields),
                  labelText: " Text her",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  setState(() {});
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((BuildContext context) =>
                          Encrypt_w(encrypt: encrypt))));
                },
                child: Container(
                  height: 70,
                  width: double.infinity,
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.lock_outline,
                        color: Colors.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Encrypt",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                )),
            TextButton(
              onPressed: () {
                setState(() {});
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((BuildContext context) =>
                        Decrypt_w(decrypt: decrypt))));
              },
              child: Container(
                height: 70,
                width: double.infinity,
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.lock_open_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Decrypt",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String Encrypt(String val) {
  String key =
      " PgEfTYaWGHjDAmxQqFLRpCJBownyUKZXkbvzIdshurMilNSVOtec#@_!=.+-*/";

  String Origin =
      " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  String results = "";

  for (int i = 0; i < val.length; i++) {
    for (int j = 0; j < Origin.length; j++) {
      if (val[i] == Origin[j]) {
        results += key[j];
        break;
      }
    }
  }

  return results;
}

String Decrypt(String val) {
  String key =
      " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

  String Origin =
      " PgEfTYaWGHjDAmxQqFLRpCJBownyUKZXkbvzIdshurMilNSVOtec#@_!=.+-*/";

  String results = "";

  for (int i = 0; i < val.length; i++) {
    for (int j = 0; j < Origin.length; j++) {
      if (val[i] == Origin[j]) {
        results += key[j];
        break;
      }
    }
  }

  return results;
}

// ignore: camel_case_types

class Encrypt_w extends StatelessWidget {
  Encrypt_w({Key? key, required this.encrypt}) : super(key: key);
  String encrypt = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Encrypted"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
          child: Center(
            child: Column(
              children: [
                const Text(
                  '👇👇 The Encrypted Text is 👇👇',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.black,
                  height: 2,
                  width: double.maxFinite,
                ),
                const SizedBox(
                  height: 20,
                ),
                SelectableText(
                  encrypt,
                  maxLines: 4,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Decrypt_w extends StatelessWidget {
  Decrypt_w({Key? key, required this.decrypt}) : super(key: key);
  String decrypt = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Decrypted"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
          child: Center(
            child: Column(
              children: [
                const Text(
                  '👇👇 The Decrypted Text is 👇👇',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.black,
                  height: 2,
                  width: double.maxFinite,
                ),
                const SizedBox(
                  height: 20,
                ),
                SelectableText(
                  decrypt,
                  maxLines: 4,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
