class Photo
{
  int id;
  String photo_name;
  int service_id;
  int owner_id;
  int c_id;

  Photo(this.id , this.photo_name, this.service_id, this.owner_id, [this.c_id]);

  Map<String, dynamic> toMap()
  {
    var map = <String, dynamic>
    {
      'id' : id,
      'image': photo_name,
      'service_id' : service_id,
      'owner_id' : owner_id,
      'c_id' : c_id,
    };
    return map;
  }

  Photo.fromMap(Map<String, dynamic> map)
  {
    id = map['id'];
    photo_name = map['image'];
    service_id = map['service_id'];
    owner_id = map['owner_id'];
    c_id = map['c_id'];
  }
}