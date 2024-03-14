class URLs {
  static const host = 'http://192.168.106.42:8080';
  static String image(String fileName) => '$host/attachments/$fileName';
}