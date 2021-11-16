import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:youtube/model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyBAq6ys1a6Hb3si5yV57bC50RPJXW2zKt0";
const ID_CANAL = "UCplT2lzN6MHlVHHLt6so39A"; //"UCCHQwcACXV96zzOXrCPjdDQ";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa");

    Map<String, dynamic> dadosJson = json.decode(response.body);
    int i = 1;
    List<Video> videos = dadosJson['items'].map<Video>((map) {
      //print("$i - ${map.toString()}");
      i++;
      return Video.fromJson(map);
    }).toList();

    return videos;
  }
}
