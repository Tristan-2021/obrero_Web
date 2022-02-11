import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as _control;
import 'package:flutter_quill/flutter_quill.dart' as document;
import 'package:flutter_quill/flutter_quill.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();

  FirebaseStorage storgeFirebase = FirebaseStorage.instance;
  final _firebaseFirestore = FirebaseFirestore.instance.collection('data');
  final _control.QuillController _controller = _control.QuillController.basic();

  final DefaultStyles _defaulStyles = DefaultStyles(
      underline: const TextStyle(fontFamily: 'Trajan Pro'),
      strikeThrough: const TextStyle(fontFamily: 'Schyler'));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              var content = jsonEncode(_controller.document.toDelta());
              var content1 =
                  jsonEncode(_controller.document.toDelta().toJson());
              _control.Document doc =
                  _control.Document.fromJson(jsonDecode(content));
              await _firebaseFirestore.add({
                'post': content,
                'post1': content1,
                'timesData': DateTime.now(),
                'titulo': _textEditingController.text
              });
            },
            icon: const Icon(Icons.save_alt_outlined),
          ),
        ],
      ),
      body: Center(
        child: Container(
            width: 800,
            height: 800,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  textAlign: TextAlign.center,
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    hintText: 'Agregar título',
                  ),
                ),
                SizedBox(
                  width: 800,
                  child: _control.QuillToolbar.basic(
                    showLink: true,
                    showAlignmentButtons: true,
                    showBackgroundColorButton: false,
                    //webImagePickImpl: _webImagePickImpl,
                    // filePickImpl:  _function,
                    //onImagePickCallback: _function,
                    controller: _controller,
                  ),
                ),
                Expanded(
                    child: Container(
                  color: Colors.white70,
                  width: 800,
                  height: 500,
                  child: _control.QuillEditor(
                    keyboardAppearance: Brightness.light,
                    focusNode: _focusNode,
                    scrollController: ScrollController(debugLabel: 'Texto'),
                    scrollable: true,
                    padding: const EdgeInsets.all(10.0),
                    autoFocus: true,
                    readOnly: false,
                    expands: true,
                    customStyles: _defaulStyles,
                    showCursor: true,
                    onLaunchUrl: _funcionurl,
                    embedBuilder: (BuildContext context,
                        _control.QuillController controls,
                        _control.Embed node,
                        bool bol) {
                      switch (node.value.type) {
                        case 'image':
                          final String imageUrl = node.value.data;
                          final size = MediaQuery.of(context).size;

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
                    // onTapUp: onTapUp ,
                    //  onLaunchUrl: _onLaunchUrl  ,
                    controller: _controller,
                  ),
                )),
              ],
            )),
      ),
    );
  }

  Future<String> _function(_file) async {
    if (_file == null) return 'null';
    print('acio $_file');

    return _file.path;
  }

  _funcionurl(String valor) {
    print('que valor deb salir $valor');
  }

  Future<String> subirimagen(Uint8List lista) async {
    var snapshot = await storgeFirebase.ref().child('newFile').putData(lista);
    String urlDowland = await snapshot.ref.getDownloadURL();

    return urlDowland;
  }

  Future<String?> _webImagePickImpl(
      OnImagePickCallback onImagePickCallback) async {
    final result = await FilePicker.platform.pickFiles();
    PlatformFile _files = result!.files.first;
    Uint8List lista = Uint8List.fromList(_files.bytes!);
    //String string = String.fromCharCodes(lista);
    var url = await subirimagen(lista);
    // print('resultado ${result.toString()}');

    if (result == null) {
      return null;
    }

    return url;
  }
}
