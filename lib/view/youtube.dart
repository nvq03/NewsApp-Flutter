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
  late Future<List<Video>> _videosFuture;

  @override
  void initState() {
    super.initState();
    _videosFuture = _fetchTrendingVideos();
  }

  Future<List<Video>> _fetchTrendingVideos() async {
    YoutubeDataApi youtubeDataApi = YoutubeDataApi();
    return await youtubeDataApi.fetchTrendingVideo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.play_arrow),
        backgroundColor: Colors.white,
        title: const Text(
          'YouTube Trending',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Video>>(
          future: _videosFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final videos = snapshot.data!;
              return ListView.separated(
                itemCount: videos.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final video = videos[index];
                  final controller = YoutubePlayerController(
                    initialVideoId: video.videoId!,
                    flags: const YoutubePlayerFlags(
                      autoPlay: false,
                      mute: false,
                      disableDragSeek: true,
                      enableCaption: true,
                      hideThumbnail: true,
                    ),
                  );
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 159, 159, 159)
                              .withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: YoutubePlayer(
                        controller: controller,
                        liveUIColor: Colors.red,
                        onReady: () {
                          controller.pause();
                        },
                        onEnded: (data) {
                          controller.pause();
                        },
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}