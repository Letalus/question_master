import 'package:flutter/material.dart';

class ExplainScreen extends StatefulWidget {
  static const String routeName = 'explain screen';
  const ExplainScreen({Key? key}) : super(key: key);

  @override
  State<ExplainScreen> createState() => _ExplainScreenState();
}

class _ExplainScreenState extends State<ExplainScreen> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/paradise_image.jpg'), fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Question master',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: BackButton(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 700),
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          image:
                              DecorationImage(image: AssetImage('assets/images/horror_image.jpg'), fit: BoxFit.cover)),
                      constraints: BoxConstraints(minHeight: 100, maxHeight: 250),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                      child: Text(
                        'This App is solely written for flutter lovers who want to experience the horror of a bad app structure and code style first hand :D',
                        style: TextStyle(fontSize: 20, height: 1.3),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Enjoy!', style: TextStyle(fontSize: 20),)),
                    SizedBox(height: 24,)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
