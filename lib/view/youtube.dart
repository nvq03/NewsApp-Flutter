import 'package:flutter/material.dart';
import 'package:youtube_data_api/models/video.dart';
import 'package:youtube_data_api/youtube_data_api.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Youtube extends StatefulWidget {
   Youtube({super.key});

  @override
  State<Youtube> createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  List<YoutubePlayerController> controllers = [];
  List<Video> videos = [];

    @override
  void initState() {
    get();
    super.initState();
  }

  get() async {
    YoutubeDataApi youtubeDataApi = YoutubeDataApi();
    videos = await youtubeDataApi.fetchTrendingVideo();
  controllers = videos.map((video) {
    return YoutubePlayerController(
      initialVideoId: video.videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        disableDragSeek: true,
        enableCaption: true,
        hideThumbnail: true,
      ),
    );
  }).toList();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.play_arrow),
        backgroundColor: Colors.white,
        title: const Text('YouTube Trending', style: TextStyle(fontFamily: 'Poppins', fontSize: 22,fontWeight: FontWeight.w500),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: videos.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            Video video = videos[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(
                            color: Color.fromARGB(255, 159, 159, 159).withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 4,
                            offset: Offset(0, 3),
                )]
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: YoutubePlayer(
                          controller: controllers[index],
                          liveUIColor: Colors.red,
                          onReady: () {
                        // Không tự động phát video khi tải xong
                        controllers[index].pause();
                          },
                          onEnded: (data) {
                        // Dừng phát video khi video kết thúc
                        controllers[index].pause();
                          },
                        ),
              ),
            );
          },
        ),
      ),
    );
  }
  }