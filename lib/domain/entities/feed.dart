import 'package:equatable/equatable.dart';

class FeedData extends Equatable {
  final String? postId;
  final UserData? user;
  final String? postContent;
  final int? likeCount;
  final List<CommentsData>? comments;
  final String? imageUrl;

  const FeedData(
      {this.postId,
      this.user,
      this.postContent,
      this.likeCount,
      this.comments,
      this.imageUrl});

  @override
  List<Object?> get props {
    return [postId, user, postContent, comments, imageUrl];
  }
}

class UserData extends Equatable {
  const UserData({
    this.userId,
    this.name,
    this.email,
    this.profilePicture,
  });
  final String? userId;
  final String? name;
  final String? email;
  final String? profilePicture;

  @override
  List<Object?> get props {
    return [userId, name, email, profilePicture];
  }
}

class CommentsData extends Equatable {
  const CommentsData({
    this.commentId,
    this.user,
    this.commentText,
    this.timestamp,
  });
  final String? commentId;
  final UserData? user;
  final String? commentText;
  final String? timestamp;

  @override
  List<Object?> get props {
    return [commentId, user, commentText, timestamp];
  }
}
