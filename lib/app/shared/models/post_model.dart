class Post {
  // final String subreddit;
  final String author;
  final String title;
  final String imagePath;
  final String thumbnailPath;
  final String upvotes;
  final List<dynamic>? answers;

  Post({
    required this.author,
    required this.title,
    required this.imagePath,
    required this.thumbnailPath,
    required this.upvotes,
    this.answers,
  });
}
