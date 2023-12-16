import 'package:konnect/data/models/feed.dart';
import 'package:konnect/data/models/home.dart';
import 'package:konnect/domain/entities/feed.dart';
import 'package:konnect/domain/entities/home.dart';

extension FeedResponseMapper on FeedResponse {
  List<FeedData> toDomain() {
    List<FeedData> feedList = <FeedData>[];
    if (feed != null && feed!.isNotEmpty) {
      for (var feedRawData in feed!) {
        List<CommentsData> comments = <CommentsData>[];
        if (feedRawData.comments.isNotEmpty) {
          for (var commentData in feedRawData.comments) {
            comments.add(CommentsData(
                commentId: commentData.commentId,
                user: UserData(
                    userId: commentData.user.userId,
                    name: commentData.user.name,
                    email: commentData.user.email,
                    profilePicture: commentData.user.profilePicture),
                commentText: commentData.commentText,
                timestamp: commentData.timestamp));
          }
        }
        var user = UserData(
            userId: feedRawData.user.userId,
            name: feedRawData.user.name,
            email: feedRawData.user.email,
            profilePicture: feedRawData.user.profilePicture);
        feedList.add(FeedData(
            postId: feedRawData.postId,
            user: user,
            postContent: feedRawData.postContent,
            likeCount: feedRawData.likeCount,
            comments: comments,
            imageUrl: feedRawData.imageUrl));
      }
    }
    return feedList;
  }
}

extension HomeResponseMapper on HomeResponse {
  List<HomeData> toDomain() {
    List<HomeData> homeList = <HomeData>[];
    if (home != null && home.isNotEmpty) {
      for (var homeRawData in home) {
        homeList.add(HomeData(
            title: homeRawData.title,
            subtitle: homeRawData.subtitle,
            icon: homeRawData.icon));
      }
    }
    return homeList;
  }
}
