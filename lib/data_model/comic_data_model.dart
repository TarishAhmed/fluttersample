import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ComicModel {
  ComicModel({
    required this.num, this.date, this.safeTitle, this.transcript, this.title, this.link, this.news, this.alt, this.img,
  });

  final int num;
  final String? date;
  final String? safeTitle;
  final String? transcript;
  final String? title;
  final String? link;
  final String? news;
  final String? alt;
  final String? img;

  @override
  String toString() {
    return '$safeTitle($date): $transcript';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is ComicModel &&
        other.num == num &&
        other.date == date &&
        other.safeTitle == safeTitle &&
        other.transcript == transcript &&
        other.title == title &&
        other.link == link &&
        other.news == news &&
        other.alt == alt &&
        other.img == img;
  }

  @override
  int get hashCode => hashValues(num, date, safeTitle, transcript, title,
      link, news, alt, img);

  static ComicModel fromJson(Map<String, dynamic> json) {
    String date = DateFormat('dd-MMM-yyyy').format(DateTime.parse('${json['year']}-${json['month']?.padLeft(2,'0')}-${json['day']?.padLeft(2,'0')}'));
    return ComicModel(
      num: json['num'],
      date: date,
      safeTitle: json['safe_title'],
      transcript: json['transcript'],
      title: json['title'],
      link: json['link'],
      news: json['news'],
      alt: json['alt'],
      img: json['img']
    );
  }
}