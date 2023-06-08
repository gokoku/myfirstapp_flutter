import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // センター寄せ
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //縦方向に並べる
          children: [
            const Text(
              //タイトル
              'スライドパズル',
              style: TextStyle(fontSize: 32),
            ),
            //縦方向に余白を作る
            const SizedBox(height: 24),
            ElevatedButton(
              child: const Text('スタート'),
              onPressed: () => showPuzzlePage(
                context,
              ),
            )
          ],
        ),
      ),
    );
  }

  void showPuzzlePage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const PuzzlePage()));
  }
}

class PuzzlePage extends StatefulWidget {
  const PuzzlePage({Key? key}) : super(key: key);

  @override
  _PuzzlePageState createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('スライドパズル'),
        actions: [
          IconButton(
            icon: const Icon(Icons.play_arrow),
            onPressed: () => {},
          ),
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () => {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: TilesView(),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => {},
                icon: const Icon(Icons.shuffle),
                label: const Text('シャッフル'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TilesView extends StatelessWidget {
  const TilesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 24,
      mainAxisSpacing: 24,
      padding: const EdgeInsets.symmetric(vertical: 24),
      // EdgeInsets は上下左右のパディング値
      children: [
        TileView(number: 1, color: Colors.blue, onPressed: () => {}),
        TileView(number: 2, color: Colors.blue, onPressed: () => {}),
        TileView(number: 3, color: Colors.blue, onPressed: () => {}),
        TileView(number: 4, color: Colors.blue, onPressed: () => {}),
        TileView(number: 5, color: Colors.blue, onPressed: () => {}),
        TileView(number: 6, color: Colors.blue, onPressed: () => {}),
        TileView(number: 7, color: Colors.blue, onPressed: () => {}),
        TileView(number: 8, color: Colors.blue, onPressed: () => {}),
      ],
    );
  }
}

class TileView extends StatelessWidget {
  final int number;
  final Color color;
  final void Function() onPressed;

  const TileView({
    Key? key,
    required this.number,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // これで角丸になる
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: color,
        textStyle: const TextStyle(fontSize: 32),
      ),
      child: Center(child: Text(number.toString())),
    );
  }
}
