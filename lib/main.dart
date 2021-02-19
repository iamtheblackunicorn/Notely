import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Color mainColor = Color(0xFF000000);
Color accentColor = Color(0xFFFFFFFF);
Color textSpaceColor = Color(0xFF35363A);
double titleFontSize = 40;
double defaultSpacing = 15;
double defaultPadding = 10;
double textFontSize = 20;
double headingFontSize = 25;
String defaultFont = 'Visby';
String titleFont = 'Runes';
int standardLength = 200;
double specialSpacingOne = 15;
double stdIconSize = 24;
double stdRounding = 5.0;
double stdSpacing = 20;
double specialSpacingTwo = 50;
double headingSpacing = 30;
String appVersion = '1.0';
String authorName = 'Alexander Abraham a.k.a.\n"The Black Unicorn"';
String appLicense = 'MIT';
String appTitle = 'NOTELY';
String gitHubUrl = 'https://github.com/iamtheblackunicorn';
String logoPath = 'assets/images/logo.png';

class NotesStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/notes.json');
  }

  Future<String> readCounter() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      return '';
    }
  }

  Future<File> writeCounter(String userNote) async {
    final file = await _localFile;
    return file.writeAsString('$userNote');
  }
}


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: HomeScreen(),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('de', ''),
        const Locale('en', '')
      ],
    )
  );
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        body: Center(
            child: SingleChildScrollView(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          new SizedBox(
            width: 250,
            height: 250,
            child: new Image(image: AssetImage(logoPath))
          ),
          SizedBox(height: headingSpacing),
          new RaisedButton(
            color: accentColor,
            child: Text(AppLocalizations.of(context).notesLabel,
                style: TextStyle(
                    color: mainColor,
                    fontSize: textFontSize,
                    fontFamily: defaultFont)),
            padding: EdgeInsets.all(defaultPadding),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditorWindow(notesStorage: NotesStorage())),
              );
            },
          ),
          SizedBox(height: defaultSpacing),
          new RaisedButton(
            color: accentColor,
            child: Text(AppLocalizations.of(context).infoLabel,
                style: TextStyle(
                    color: mainColor,
                    fontSize: textFontSize,
                    fontFamily: defaultFont)),
            padding: EdgeInsets.all(defaultPadding),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Info()),
              );
            },
          ),
        ]))));
  }
}

class EditorWindow extends StatefulWidget {
  final NotesStorage notesStorage;
  EditorWindow({Key key, @required this.notesStorage}) : super(key: key);
  @override
  EditorWindowState createState() => new EditorWindowState();
}
class EditorWindowState extends State<EditorWindow> {
  String userNote;
  Map<String,dynamic> noteMap;
  String noteBody;
  @override
  void initState() {
    super.initState();
    widget.notesStorage.readCounter().then((String value) {
      setState(() {
        userNote = value;
      });
    });
  }
  Future<File> saveNote(String userIO) {
    List<String> initialNoteKeyList = userIO.split(' ');
    List<String> noteKeyList = [];
    for(int i = 0; i < 4; i++){
      noteKeyList.add(initialNoteKeyList[i]);
    }
    String noteKey = noteKeyList.join(' ');
    noteMap.addAll({noteKey:userIO});
    userNote = json.encode(noteMap);
    return widget.notesStorage.writeCounter(userNote);
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController editingController = new TextEditingController();
    String newNoteBodyText = AppLocalizations.of(context).newNoteBodyLabel;
    String newNoteText = AppLocalizations.of(context).newNoteLabel;
    if(userNote == '' || userNote == null){
      setState((){
        noteMap = {
          newNoteText: newNoteBodyText
        };
      });
    }
    else{
      setState((){
        noteMap = json.decode(userNote);
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Text(
              AppLocalizations.of(context).notesLabel,
              style: TextStyle(
                color: accentColor,
                fontSize: textFontSize
              ),
            ),
          ]
        ),
        actions: <Widget>[

          new Padding(
            padding: EdgeInsets.only(right: specialSpacingOne),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: accentColor,
                size: stdIconSize,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(right: specialSpacingOne),
            child: IconButton(
              icon: Icon(
                Icons.save,
                color: accentColor,
                size: stdIconSize,
              ),
              onPressed: () {
                saveNote(editingController.text);
              },
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(right: specialSpacingOne),
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: accentColor,
                size: stdIconSize,
              ),
              onPressed: () {
                editingController.value = TextEditingValue(
                  text: '',
                );
              },
            ),
          )

        ],
        backgroundColor: mainColor
      ),
      body: Center(
        child:
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Container(
                  decoration: new BoxDecoration(
                    color: textSpaceColor,
                  ),
                  child: new TextFormField(
                    controller: editingController,
                    cursorColor: accentColor,
                    keyboardType: TextInputType.multiline,
                    maxLines: standardLength,
                    autofocus: false,
                    decoration: new InputDecoration(
                      contentPadding: EdgeInsets.all(defaultPadding),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      counterText: '',
                      hintText: AppLocalizations.of(context).placeHolderLabel,
                      hintStyle: TextStyle(
                        fontSize: textFontSize,
                        color: accentColor,
                        fontFamily: defaultFont
                      ),
                    ),
                    style: TextStyle(
                      height: 2.0,
                      color: accentColor,
                      fontSize: textFontSize,
                      fontFamily: defaultFont
                    )
                  )
                ),
              ]
            )
          )
        ),
      drawer: Drawer(
        child: ListView.builder(
          itemCount: noteMap.length,
          itemBuilder: (context, index) {
            String key = noteMap.keys.elementAt(index);

            return ListTile(
              title: Text(
                '$key',
                style: TextStyle(
                  color: mainColor,
                  fontSize: textFontSize,
                  fontFamily: defaultFont
                )
              ),
              onTap: () {
                Navigator.pop(context);
                editingController.value = TextEditingValue(
                  text: noteMap[key],
                  selection: TextSelection.fromPosition(
                    TextPosition(offset: noteMap[key].length),
                  ),
                );
              },
            );
          }
        )
      ),
    );
  }
}

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String underText = AppLocalizations.of(context).underLabel;
    String licenseText = AppLocalizations.of(context).licenseLabel;
    String byText = AppLocalizations.of(context).byLabel;
    String viewingText = AppLocalizations.of(context).viewingLabel;
    return Scaffold(
        backgroundColor: textSpaceColor,
        appBar: AppBar(
          title: new Text(
            AppLocalizations.of(context).infoLabel,
            style: TextStyle(
              color: accentColor,
              fontSize: textFontSize,
              fontFamily: defaultFont
            )
          ),
          backgroundColor: mainColor
        ),
        body: Center(
          child: SingleChildScrollView(
            child:Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: specialSpacingTwo),
                  new Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(stdRounding)
                    ),
                    color: accentColor,
                    margin: EdgeInsets.all(defaultPadding),
                    child: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Text(
                            AppLocalizations.of(context).appInfoLabel,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: mainColor,
                              fontSize: headingFontSize,
                              fontFamily: defaultFont
                            )
                          ),
                          SizedBox(height: defaultPadding),
                          new Text(
                            '$appTitle v.$appVersion $byText $authorName $underText $appLicense $licenseText.\n$viewingText:\n$gitHubUrl',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: mainColor,
                              fontSize: textFontSize,
                              fontFamily: defaultFont
                            )
                          ),
                        ],
                      ),
                    )
                  ),
                  SizedBox(height: stdSpacing),
                  new RaisedButton(
                    color: accentColor,
                    child: Text(
                      AppLocalizations.of(context).gotItLabel,
                      style: TextStyle(
                        color: mainColor,
                        fontSize: textFontSize,
                        fontFamily: defaultFont
                      )
                    ),
                    padding: EdgeInsets.all(defaultPadding),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                  ),
                  SizedBox(height: specialSpacingTwo)
                ]
              )
            )
          )
        );
      }
    }
