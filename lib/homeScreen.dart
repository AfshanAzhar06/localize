import 'package:flutter/material.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localisation/Controller/language_change_controller.dart';
import 'package:provider/provider.dart';

class HomeScren extends StatefulWidget {
  const HomeScren({super.key});

  @override
  State<HomeScren> createState() => _HomeScrenState();
}

enum Language {english, spanish}

class _HomeScrenState extends State<HomeScren> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
        
        actions: [
         Consumer<LanguageChangeController>(
          builder: (context, provider, child){
          return  PopupMenuButton(
              onSelected: (Language item){
                if(Language.english.name == item.name){
                  provider.changeLanguage(Locale('en'));
                }else{
                  print('spans');
                    provider.changeLanguage(Locale('es'));
                }
              },
              itemBuilder: (BuildContext contex) => <PopupMenuEntry<Language>>[
                    const PopupMenuItem(
                        value: Language.english, child: Text("ENGLISH")),
                    const PopupMenuItem(
                        value: Language.spanish, child: Text("SPANISH")
                        )
                  ]
                  );
         }
         )
        ],
      ),
      body:SafeArea(
        child: Column(
        children: [
          Text(AppLocalizations.of(context)!.name)
        ],
      ),
    ),
    );
  }
}
