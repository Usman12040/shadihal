class Photo
{
  int id;
  String photo_name;
  int service_id;
  int c_id;

  Photo( this.photo_name, this.service_id, [this.id, this.c_id]);

  Map<String, dynamic> toMap()
  {
    var map = <String, dynamic>
    {
      'id' : id,
      'image': photo_name,
      'service_id' : service_id,
      'c_id' : c_id,
    };
    return map;
  }

  Photo.fromMap(Map<String, dynamic> map)
  {
    id = map['id'];
    photo_name = map['image'];
    service_id = map['service_id'];
    c_id = map['c_id'];
  }
}