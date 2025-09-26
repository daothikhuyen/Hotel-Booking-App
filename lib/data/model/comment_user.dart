import 'package:hotel_booking_app/data/model/comment.dart';
import 'package:hotel_booking_app/data/model/user.dart';

class CommentWithUser {
  CommentWithUser({required this.comment, required this.user});
  final Comment comment;
  final HBUser user;
}
