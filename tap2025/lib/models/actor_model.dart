class ActorModel {
  String knownForDepartment;
  String name;
  String originalName;
  String profilePath;
  String character;
  int order;

  ActorModel({
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.profilePath,
    required this.character,
    required this.order,
  });
  factory ActorModel.fromMap(Map<String,dynamic> actor){
    return ActorModel(
      knownForDepartment: actor['known_for_department'], 
      name: actor['name'], 
      originalName: actor['original_name'], 
      profilePath: actor['profile_path'] != null
        ? 'https://image.tmdb.org/t/p/w500/${actor['profile_path']}'
        : 'https://support.heberjahiz.com/hc/article_attachments/21013076295570', 
      character: actor['character'], 
      order: actor['order']
    );
  }
}
