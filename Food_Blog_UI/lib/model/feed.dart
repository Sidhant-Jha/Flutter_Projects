class FeedModel
{
  final String profileText;
  final String customerName;
  final String customerHandle;
  final String customerQuery;
  final String feedDate;
  final int feedComments;
  final List<String> imageUrl;

  const FeedModel({
    required this.profileText,
    required this.customerName,
    required this.customerHandle,
    required this.customerQuery,
    required this.feedDate,
    required this.feedComments,
    this.imageUrl = const []
  });

}