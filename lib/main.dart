import 'package:flutter/material.dart';
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
String appVersion = '1.0';
String authorName = 'Alexander Abraham a.k.a.\n"The Black Unicorn"';
String appLicense = 'MIT';
String appTitle = 'NOTELY';

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
          new Text(appTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: accentColor,
                  fontSize: titleFontSize,
                  fontFamily: titleFont)),
          SizedBox(height: defaultSpacing),
          new RaisedButton(
            color: accentColor,
            child: Text('Notes',
                style: TextStyle(
                    color: mainColor,
                    fontSize: textFontSize,
                    fontFamily: defaultFont)),
            padding: EdgeInsets.all(defaultPadding),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditorWindow()),
              );
            },
          ),
          SizedBox(height: defaultSpacing),
          new RaisedButton(
            color: accentColor,
            child: Text('Info',
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
class EditorWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController editingController = new TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Text(
              'NOTES',
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
                Icons.save,
                color: accentColor,
                size: stdIconSize,
              ),
              onPressed: () {
                Navigator.pop(context);
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
                      hintText: 'WRITE YOUR NOTE HERE. :)',
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
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'YOUR NOTES',
                style: TextStyle(
                  color: accentColor,
                  fontSize: textFontSize,
                  fontFamily: defaultFont
                )
              ),
              decoration: BoxDecoration(
                color: mainColor,
              ),
            ),

            ListTile(
              title: Text(
                'CLOSE MENU',
                style: TextStyle(
                  color: mainColor,
                  fontSize: textFontSize,
                  fontFamily: defaultFont
                )
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),

          ],
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: textSpaceColor,
        appBar: AppBar(
          title: new Text(
            'INFO',
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
                            'APP INFO',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: mainColor,
                              fontSize: headingFontSize,
                              fontFamily: defaultFont
                            )
                          ),
                          SizedBox(height: defaultPadding),
                          new Text(
                            '$appTitle v.$appVersion by $authorName licensed under the $appLicense license',
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
                      'GOT IT',
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
