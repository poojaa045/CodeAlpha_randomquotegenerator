import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState()=>_LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  List<String> items = ['FYCS', 'SYCS', 'TYCS'];
  String? selecteditems;
  String? selectedGender;
  bool isChecked = false;
  bool isHindiChecked = false;
  bool isMarathiChecked = false;


  final TextEditingController usernameController= TextEditingController();
  final TextEditingController passwordController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LoginPage')),
      body: Padding(padding: EdgeInsets.all(20),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              controller:usernameController,
              decoration:InputDecoration(
                labelText:'First Name',
                border:OutlineInputBorder(),
              ),
            ), SizedBox(height:20),
            TextField(
              controller:passwordController,
              decoration:InputDecoration(
                labelText:'Last Name',
                border:OutlineInputBorder(),
              ),
            ), SizedBox(height:20),
            Text(
              "Select Gender",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(title:Text ("Male"),
              leading: Radio<String>(
                value:"Male",
                groupValue: selectedGender,
                onChanged: (value){
                  setState(() {
                    selectedGender= value;
                  });
                },
              ),),
            ListTile(title:Text ("Female"),
              leading: Radio<String>(
                value:"Female",
                groupValue: selectedGender,
                onChanged: (value){
                  setState(() {
                    selectedGender=value;
                  });
                },
              ),),
            Text(
              "Select Language",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
                controlAffinity:ListTileControlAffinity.leading,
                title:Text("English"),
                value: isChecked,
                onChanged: (bool? value){
                  setState(() {
                    isChecked=value!;
                  });
                }),
            CheckboxListTile(
                controlAffinity:ListTileControlAffinity.leading,
                title:Text("Hindi"),
                value: isHindiChecked,
                onChanged: (bool? value1){
                  setState(() {
                    isHindiChecked=value1!;
                  });
                }),
            CheckboxListTile(
                controlAffinity:ListTileControlAffinity.leading,
                title:Text("Marathi"),
                value: isMarathiChecked,

                onChanged: (bool? value2){
                  setState(() {
                    isMarathiChecked=value2!;
                  });
                }),
            SizedBox(height: 20),
            Text(
              "Select Class:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: DropdownButton <String>
                  (hint: Text("Select your Class:"),
                  value: selecteditems,
                  items: items.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selecteditems = newValue!;
                    });
                  },

                ),
              ),
            ),
            ElevatedButton(
              onPressed:(){
                String username = usernameController.text.trim();
                // Combine selected languages into a single string
                List<String> langs = [];
                if (isChecked) langs.add("English");
                if (isHindiChecked) langs.add("Hindi");
                if (isMarathiChecked) langs.add("Marathi");


                String langString =
                langs.isNotEmpty ? langs.join(", ") : "None";


                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomePage(username: username, pass:passwordController.text.trim(),selectedGender: selectedGender ?? "Not selected",
                      lang: langString,clas: selecteditems ?? "Not selected",),
                  ),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  final String username,pass,selectedGender,lang,clas;

  WelcomePage(
      {required this.username,
        required this.pass,
        required this.selectedGender,
        required this.lang,
        required this.clas,


      }
      )
  ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: $username\n Password: $pass\n gender: $selectedGender\n Language:$lang\n  Class:$clas\n',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to login page
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
