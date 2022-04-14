import 'dart:convert';

enum BugType { loginBug, newsBug }

class Bug {

  static Bug loginBug(String email, String university, String department, String semester, String device, String appVersion, String? logFile) {
    Bug bug = Bug(BugType.loginBug);
    bug.data = {
      'email': email,
      'university': university,
      'department': department,
      'semester': semester,
      'device': device,
      'appVersion': appVersion,
      'logFile': logFile ?? 'none'
    };
    return bug;
  }

  static Bug newsBug(String latestIDs, String oldestIDs, String page, String sort, String filter,
      String subscribedWebsites, String website, String articleID, String email, String type, String device, String appVersion) {
    Bug bug = Bug(BugType.newsBug);
    bug.data = {
      'email': email,
      'latestIDs': latestIDs,
      'oldestIDs': oldestIDs,
      'page': page,
      'sort': sort,
      'filter': filter,
      'subscribedWebsites': subscribedWebsites,
      'website': website,
      'articleID': articleID,
      'device': device,
      'appVersion': appVersion,
      'type': type
    };
    return bug;
  }

  BugType type;
  Map<String, dynamic> data = {};

  Bug(this.type);

  String getJson() => json.encode(data);

  String getUrl(String base) {
    String url = "$base/report/bug";

    switch(type) {
      case BugType.loginBug: break;
      case BugType.newsBug: url += '/news';
    }

    return url;
  }
}