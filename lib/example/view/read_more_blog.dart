import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nombreapp/example/model/blog.dart';
import 'package:flutter_quill/flutter_quill.dart' as _control;
import 'package:flutter_quill/flutter_quill.dart' as document;
import 'package:url_launcher/url_launcher.dart';

class ReadBlog extends StatefulWidget {
  final Blog blog;
  const ReadBlog({Key? key, required this.blog}) : super(key: key);

  @override
  State<ReadBlog> createState() => _ReadBlogState();
}

class _ReadBlogState extends State<ReadBlog> {
  final _control.DefaultStyles _defaulStyles = _control.DefaultStyles(
      underline: const TextStyle(fontFamily: 'Trajan Pro'),
      strikeThrough: const TextStyle(fontFamily: 'Schyler'));

  @override
  Widget build(BuildContext context) {
    document.Document doc =
        document.Document.fromJson(jsonDecode(widget.blog.post));

    _control.QuillController _controller = _control.QuillController(
        document: doc, selection: const TextSelection.collapsed(offset: 0));

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              // context.goNamed('home');
            },
            icon: const Icon(
              Icons.home,
              color: Colors.black,
            )),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Text(
                widget.blog.titulo,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Schyler',
                    fontSize: 23.0,
                    fontWeight: FontWeight.w700),
                overflow: TextOverflow.fade,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: SizedBox(
                  width: 700,
                  child: _control.QuillEditor(
                    keyboardAppearance: Brightness.light,
                    focusNode: FocusNode(),
                    scrollController: ScrollController(debugLabel: 'Texto'),
                    scrollable: true,
                    padding: const EdgeInsets.all(10.0),
                    autoFocus: true,
                    readOnly: true,
                    expands: true,
                    customStyles: _defaulStyles,
                    showCursor: true,
                    onLaunchUrl: _urllauncher,
                    embedBuilder: (
                      BuildContext context,
                      _control.QuillController controlss,
                      _control.Embed node,
                      bool bol,
                    ) {
                      switch (node.value.type) {
                        case 'image':
                          final String imageUrl = node.value.data;

                          return Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: SizedBox(
                                height: 400,
                                child: Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                )),
                          );

                        default:
                          throw UnimplementedError(
                            'Embeddable type "${node.value.type}" is not supported by default '
                            'embed builder of QuillEditor. You must pass your own builder function '
                            'to embedBuilder property of QuillEditor or QuillField widgets.',
                          );
                      }
                    },
                    //onTapUp: onTapUp ,

                    // onLaunchUrl: _urllauncher  ,
                    controller: _controller,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _funcionurl(String valor) {}

  _urllauncher(String url) async {
    if (!url.startsWith('http')) {
      url = 'https://$url';
    }

    await launch(url);
  }
}
