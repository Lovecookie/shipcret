enum ERouteMainCategory {
  welcome,
  home,
}

enum EWelcomeType {
  none,
  signin,
  signup,
}

enum EAuthStatusType {
  notDetermined, //  NOT_DETERMINED,
  notLoggedIn, // NOT_LOGGED_IN,
  loggedIn, // LOGGED_IN,
}

enum ETweetType {
  tweet,
  detail,
  reply,
  parentTweet,
}

enum ESortUserType {
  verified,
  alphabetically,
  newest,
  oldest,
  maxFollower,
}

enum ENotificationType {
  notDetermined,
  message,
  tweet,
  reply,
  retweet,
  follow,
  mention,
  like,
}

enum EFeedContentType {
  none,
  content,
  image,
  video,
}
