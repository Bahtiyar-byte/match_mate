import 'package:flutter/material.dart';
import 'package:match_mate/datastore/data_context.dart';
import 'package:match_mate/screens/screen_manager.dart';
import 'package:provider/provider.dart';

import '../../datastore/data_context.dart';
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final dataContext = Provider.of<DataContext>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                          onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Image.asset(
                          'assets/images/mateLogin.png',
                          width: 200,
                        ),
                      ),
                    ),
                    Text(
                      'Match Mate',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black), // Уменьшаем размер текста
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Find your perfect match!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20), // Уменьшаем вертикальный отступ
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text('Forgot your password?', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    // Handle forgot password logic here
                  },
                ),
              ),

              SizedBox(height: 10),


              ElevatedButton(
                onPressed: () {
                  ScreenManager.openPersonsScreen(context);
                },
                style: ElevatedButton.styleFrom(

                  primary: Theme.of(context).hintColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  minimumSize: Size(double.infinity, 0),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Текст "OR" посередине полосы
              Stack(
                children: [
                  Container(
                    height: 1,
                    color: Colors.grey, // Серый цвет
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Container(
                      color: Colors.white, // Цвет фона текста
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Login using',
                        style: TextStyle(
                          color: Colors.black, // Белый цвет текста
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ScreenManager.openPersonsScreen(context);

                    },
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).hintColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      minimumSize: Size(145, 0),
                    ),
                    child: Text(
                      'Facebook',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      ScreenManager.openPersonsScreen(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).hintColor, //  цвет фона
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0), // Уменьшаем радиус для создания менее круглых краев
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Устанавливаем горизонтальные отступы
                      minimumSize: Size(145, 0), // Ширина кнопки
                    ),
                    child: Text(
                      'Google',
                      style: TextStyle(
                        color: Colors.white, // Белый текст
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),



              SizedBox(height: 10), // Уменьшаем вертикальный отступ

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?', style: TextStyle(color: Colors.black)),
                  TextButton(
                    child: Text('Sign up', style: TextStyle(color: Colors.black)),
                    onPressed: () {
                      dataContext.user?.subscribedTips = [];
                      ScreenManager.openTipsScreen(context);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
