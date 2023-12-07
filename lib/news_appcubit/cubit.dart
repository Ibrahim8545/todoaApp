import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/business/buseinessScreen.dart';
import 'package:todo_app/news_appcubit/states.dart';
import 'package:todo_app/science/scienceScreen.dart';
import 'package:todo_app/settingScreen/settingsScreen.dart';
import 'package:todo_app/sports/sportsScreen.dart';

class NewsCubit extends Cubit<NewsStates> 
{
  NewsCubit() : super(IntialState ());
  static NewsCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;

  List<BottomNavigationBarItem>Bottoms=
  [
  const  BottomNavigationBarItem(
    icon: Icon(
    Icons.business),
    label: 'Business'

    ),
     const  BottomNavigationBarItem(
    icon: Icon(
    Icons.sports),
    label: 'Sports'

    ),
     const  BottomNavigationBarItem(
    icon: Icon(
    Icons.science),
    label: 'Science'

    ),
    const  BottomNavigationBarItem(
    icon: Icon(
    Icons.settings),
    label: 'Setting',

    ),

  ];
  
  List<Widget>screens=
  [
   BusinessScreen(),
   SportScreen(),
   ScienceScreen(),
   SettingScreen(),

  ];
  void ChangeBottomNavBar(int index)
  {
    currentIndex=index;
    emit(NewsBottomNavState());
  }

}