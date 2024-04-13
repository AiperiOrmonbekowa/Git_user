
class GitHubUser {
  final String login;
  final int id;
  final String avatarURL;
  final String htmlURL;

  GitHubUser({
    required this.login,
    required this.id,
    required this.avatarURL,
    required this.htmlURL,
  });

  factory GitHubUser.fromJson(Map<String, dynamic> json) {
    return GitHubUser(
      login: json['login'],
      id: json['id'],
      avatarURL: json['avatar_url'],
      htmlURL: json['html_url'],
    );
  }
}