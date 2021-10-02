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

  List<String> phrases  = [
    'Переезжаем жить на радугу… Надоело жить на зебре.',
    'И даже не смей думать, что ты можешь не выдержать.  \nЭрнест Хемингуэй.',
    'Если хочешь узнать человека, не слушай, что о нём говорят другие, послушай, что он говорит о других.',
    'Бери от жизни все, что можешь! Потом захочешь, но не сможешь... ',
    'Быть может судьба испытывает нас не для того чтобы показать нашу слабость, а для того чтобы открыть в нас наши силы..',
    'Все важные вещи в этом мире сделаны из истины и радости, а не из ткани и стекла.',
    'Умей ценить того кто без тебя не может, и не гонись за тем кто счастлив без тебя!',
    'Ошибок не делают только спящие. ',
    'Всё будет правильно, на этом построен мир.   ',
    'Они научили меня ценить верность… и никогда не забывать о тех, кого любишь.',
    'Я умею говорить:«Мне все равно»,— более того, я умею в это верить. ',
    'Проблемы заставляют умных людей - действовать, глупых - они вгоняют в депрессию!',
    'Не печалься же ни о чем заранее и не радуйся тому, чего еще нет.',
  ];

  void newPhrase()async {
    setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _counter++;
      if(phrases.length == _counter){
        _counter = 0;
      }
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(

        child: loading?buildLoading():Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                phrases[_counter],
                style: Theme.of(context).textTheme.headline6!.copyWith(),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          newPhrase();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget buildLoading(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text("Придумываю фразу..."),
        SizedBox(height: 12,),
        CupertinoActivityIndicator(),
      ],
    );
  }
}
