// in future would be replaced by requests
List videos = [
  {
    'id': '1',
    'previewImage': 'resources/images/videos/1.jpg',
    'description': 'TOP MOMENTS TWITCH #NN',
    'length': '10:35',
    'channelAvatarImage': 'resources/images/channels/1.jpg',
    'channelName': 'TWITCH | BEST CLIPS',
    'views': '137k views',
    'shortUploadedAt': '3 weeks ago',
    'uploadedAt': 'Sep 27, 2021',
    'likes': '25000',
    'dislikes': '13',
    'subscribers': '250k'
  },
  {
    'id': '2',
    'previewImage': 'resources/images/videos/2.jpg',
    'description': 'Twitch Music',
    'length': '2:59:51',
    'channelAvatarImage': 'resources/images/channels/2.jpg',
    'channelName': 'Combo',
    'views': '20m views',
    'shortUploadedAt': '7 years ago',
    'uploadedAt': 'Jul 21, 2015',
    'likes': '500k',
    'dislikes': '321',
    'subscribers': '750k'
  },
  {
    'id': '3',
    'previewImage': 'resources/images/videos/3.jpg',
    'description': 'Chill Vibes Music',
    'length': '1:21:01',
    'channelAvatarImage': 'resources/images/channels/2.jpg',
    'channelName': 'Combo',
    'views': '20m views',
    'shortUploadedAt': '7 years ago',
    'uploadedAt': 'Jun 8, 2015',
    'likes': '450k',
    'dislikes': '1239',
    'subscribers': '750k'
  }
];

Map getVideoById(dynamic id) {
  return videos.firstWhere((element) => element['id'] == id);
}

List getVideos() {
  return videos;
}
