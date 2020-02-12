class UserModel{
  String userId;
  String userName;

  UserModel({this.userId,this.userName});

  UserModel.fromMap(Map map){
    if(check("user_id", map)){
      userId = map["user_id"];
    }
    if(check("username", map)){
      userName = map["username"];
    }
  }

  check(String key,Map map){
    return map != null && map.containsKey(key) && map[key] != null;
  }
}