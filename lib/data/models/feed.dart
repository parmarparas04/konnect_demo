class FeedResponse {
  FeedResponse({
    required this.feed,
  });
  late final List<Feed>? feed;

  FeedResponse.fromJson(Map<String, dynamic> json) {
    feed = List.from(json['feed']).map((e) => Feed.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['feed'] = feed?.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Feed {
  Feed({
    required this.postId,
    required this.user,
    required this.postContent,
    required this.likeCount,
    required this.comments,
    required this.imageUrl,
  });
  late final String postId;
  late final User user;
  late final String postContent;
  late final int likeCount;
  late final List<Comments> comments;
  late final String imageUrl;

  Feed.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    user = User.fromJson(json['user']);
    postContent = json['post_content'];
    likeCount = json['like_count'];
    comments =
        List.from(json['comments']).map((e) => Comments.fromJson(e)).toList();
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['post_id'] = postId;
    _data['user'] = user.toJson();
    _data['post_content'] = postContent;
    _data['like_count'] = likeCount;
    _data['comments'] = comments.map((e) => e.toJson()).toList();
    _data['image_url'] = imageUrl;
    return _data;
  }
}

class User {
  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.profilePicture,
  });
  late final String userId;
  late final String name;
  late final String email;
  late final String profilePicture;

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    profilePicture = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['name'] = name;
    _data['email'] = email;
    _data['profile_picture'] = profilePicture;
    return _data;
  }
}

class Comments {
  Comments({
    required this.commentId,
    required this.user,
    required this.commentText,
    required this.timestamp,
  });
  late final String commentId;
  late final User user;
  late final String commentText;
  late final String timestamp;

  Comments.fromJson(Map<String, dynamic> json) {
    commentId = json['comment_id'];
    user = User.fromJson(json['user']);
    commentText = json['comment_text'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['comment_id'] = commentId;
    _data['user'] = user.toJson();
    _data['comment_text'] = commentText;
    _data['timestamp'] = timestamp;
    return _data;
  }
}
