import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CaraGado extends StatefulWidget {
  @override
  _CaraGadoState createState() => _CaraGadoState();
}

class _CaraGadoState extends State<CaraGado> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'Jm1ThTdVgwo', // Video ID from YouTube URL
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cara Memasak Gado-Gado'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                progressColors: ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
                onReady: () {
                  _controller.addListener(() {});
                },
              ),
              SizedBox(height: 8),
              Text(
                'Klik gambar di atas untuk menonton video tutorial.',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 16),
              Text(
                'Bahan Masakan:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '- 200g kacang tanah\n'
                '- 100ml air matang\n'
                '- 1 siung bawang putih\n'
                '- 2 lembar daun jeruk\n'
                '- 2 sdm air asam jawa\n'
                '- Garam secukupnya\n'
                '- Gula merah secukupnya\n'
                '- Sayuran (kentang, tauge, kol, dll)\n'
                '- Tahu dan tempe\n'
                '- Telur rebus\n',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Cara Pembuatan:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '1. Goreng kacang tanah hingga matang.\n'
                '2. Haluskan kacang tanah dengan bawang putih dan daun jeruk.\n'
                '3. Campurkan bumbu halus dengan air asam jawa, garam, dan gula merah.\n'
                '4. Rebus sayuran hingga matang.\n'
                '5. Goreng tahu dan tempe hingga kecokelatan.\n'
                '6. Sajikan sayuran, tahu, tempe, dan telur dengan saus kacang.\n',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}