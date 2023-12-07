import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/news_appcubit/cubit.dart';
import 'package:todo_app/news_appcubit/states.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit =NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('NewsApp'),
              actions: [
                IconButton
                ( 
                icon:Icon(Icons.search),
                onPressed:(){

                },
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.ChangeBottomNavBar(index);
                cubit.screens[cubit.currentIndex];
              },
              items:cubit.Bottoms,
              
               
              ),
          );
        },
      ),
    );
  }
}
