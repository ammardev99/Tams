import 'package:http/http.dart' as http;
import 'package:tams/models/blog_model.dart';

class AddBlogApiService {
  static const String apiUrl = 'https://travelagency-rho.vercel.app/api/blog';

  Future<void> addBlog(Blog blog) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl))
        ..fields['title'] = blog.title
        ..fields['location'] = blog.location
        ..fields['memory'] = blog.memory
        ..fields['date'] = blog.date
        ..fields['author'] = blog.author
        ..files.add(http.MultipartFile.fromBytes('image', blog.image, filename: 'image.jpg'));

      var response = await request.send();

      if (response.statusCode == 201) {
        // ignore: avoid_print
        print('Blog added successfully!');
      } else {
        // throw Exception('Failed to add blog: ${await response.stream.bytesToString()}');
      }
    } catch (e) {
      throw Exception('Failed to add blog: $e');
    }
  }
}
