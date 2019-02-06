
class BaseItem {
  String id;
  String name;

  BaseItem (var data) {
    assert(data is Map);

    id = data["id"];
    name = data["name"];
  }
}