class Video {
  String? id;
  String? titulo;
  String? descricao;
  String? imagem;
  String? canal;

  Video({this.id, this.titulo, this.descricao, this.imagem, this.canal});

  factory Video.fromJson(Map<String, dynamic> map) {
    return Video(
        id: map["id"]["videoId"],
        titulo: map["snippet"]["title"],
        descricao: map["snippet"]["description"],
        imagem: map["snippet"]["thumbnails"]["high"]["url"],
        canal: map["snippet"]["channelTitle"]);
  }
}
