import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool loading = false;
  int _counter = 0;
  int _picture = 17;
  int _currentPicture = 0;



  List<String> phrases  = [
  "Неважно с какой скоростью ты двигаешься, главное не останавливаться ©Кама Пуля",
  "Работать не стыдно. А теперь прочитай это наоборот ©Адам Кусарский",
  "Не бывает безвыходных ситуаций. Бывают ситуации, выход из которых тебя не устраивает ©Мага Лезгин",
  "Возможности не приходят сами — вы создаете их ©Гитя Сагитов",
  "Чтобы достичь успеха, перестаньте гнаться за деньгами, гонитесь за мечтой ©Хамзат Сом",
  "Одна победа не ведет к успеху, в отличие от постоянного желания побеждать ©Исрапил Мурадов",
  "Надо посмотреть правильно на эту жизн, как она идет и куда она идет ©Мурад Легенда",
  "Успех – это лестница, на нее не взобраться, держа руки в карманах ©Магомед Нурмагомедов",
  "Я этого хочу. Значит, это будет ©Сагърай Лезгияр",
  "Лучший способ взяться за что-то — перестать говорить и начать делать ©Рома Колесов",
  "Или вы управляете днём, или день управляет вами ©Зес Снайфс",
  "Учитесь на своих ошибках, признайте их и двигайтесь дальше ©Абдул Нос",
  "Боль — лучшая мотивация! ©Бахмурад",
  "Упорствуйте, когда другие сдаются ©Дуба Грозный",
  "Если поставлена цель, ее надо достичь, иначе чего ты стоишь? ©Азам Царлист",
  "Требуй от себя невозможного и получишь максимум. ©Арсло Аджиев",
  "Даже если вы съедены, у вас всё равно есть два выхода ©Андрей Кореньков",
  ];

  void newPhrase()async {
    setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _counter++;
      _currentPicture++;
      if(phrases.length == _counter){
        _counter = 0;
      }
      if(_currentPicture == _picture){
        _currentPicture = 0;
      }
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Center(
          child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> Info()));
              },
              child: Icon(Icons.info_outline, color: Colors.white,)),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset("assets/$_currentPicture.png", fit: BoxFit.cover,),
          ),
          Center(

            child: loading?buildLoading():Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Container(
                  color: Colors.black.withOpacity(0.6),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      phrases[_counter],
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: InkWell(

                onTap: (){
                  newPhrase();
                },
                  child: Icon(Icons.refresh, color: Colors.white, size: 38,)),
            ),
          ),
        ],
      ),

    );
  }

  Widget buildLoading(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text("Придумываю фразу...", style: TextStyle(color: Colors.white), ),
        SizedBox(height: 12,),
        CupertinoActivityIndicator(),
      ],
    );
  }
}


class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        centerTitle: true,
        title: Text("@designer.wasp", style: TextStyle(color: Colors.white, fontSize: 14),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Center(
          child: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios, color: Colors.white,)),
        ),
      ),
      body: Stack(

        children: [

          Image.asset("assets/5.png", width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, fit: BoxFit.cover,),

          Container(
            width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
          ),
          Column(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("Все цитаты не имеют ничего общего с реальностью, любые совпадения с реальностью были случайны или непреднамеренны . Цитаты собраны из уст Великих персонажей общежития No.1 МТУСИ", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.white),),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("Изображения и Цитаты могут быть защищены авторским правом", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

