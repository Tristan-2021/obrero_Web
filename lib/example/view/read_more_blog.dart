// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:nombreapp/example/model/blog.dart';
// import 'package:flutter_quill/flutter_quill.dart' as _control;
// import 'package:url_launcher/url_launcher.dart';

// class ReadBlog extends StatefulWidget {
//   final Blog? blog;
//   const ReadBlog({Key? key, this.blog}) : super(key: key);

//   @override
//   State<ReadBlog> createState() => _ReadBlogState();
// }

// class _ReadBlogState extends State<ReadBlog> {
//   final _control.DefaultStyles _defaulStyles = _control.DefaultStyles(
//       underline: const TextStyle(fontFamily: 'Trajan Pro'),
//       strikeThrough: const TextStyle(fontFamily: 'Schyler'));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//             onPressed: () {
//               // context.goNamed('home');
//             },
//             icon: const Icon(
//               Icons.home,
//               color: Colors.black,
//             )),
//       ),
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             children: const [
//               SizedBox(
//                 height: 20.0,
//               ),
//               Text(
//                 'widget.blog.titulo',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontFamily: 'Schyler',
//                     fontSize: 23.0,
//                     fontWeight: FontWeight.w700),
//                 overflow: TextOverflow.fade,
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   _urllauncher(String url) async {
//     if (!url.startsWith('http')) {
//       url = 'https://$url';
//     }

//     await launch(url);
//   }
// }
