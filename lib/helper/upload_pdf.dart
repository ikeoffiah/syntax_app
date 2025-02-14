import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:supabase_flutter/supabase_flutter.dart';

/// upload pdf
Future<String?> uploadPdf() async {
  try {
    // Pick PDF file
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: <String>['pdf'],
    );

    if (result == null) {
      return null;
    }

    // Get file path
    final File file = File(result.files.single.path!);
    final String fileName = path.basename(file.path);

    // Generate unique file name to avoid conflicts
    final String uniqueFileName =
        '${DateTime.now().millisecondsSinceEpoch}_$fileName';

    // Upload file to Supabase storage
    final String response = await Supabase.instance.client.storage
        .from('test') // Replace 'pdfs' with your bucket name
        .upload(
          uniqueFileName,
          file,
          fileOptions: const FileOptions(
            cacheControl: '3600',
            upsert: false,
          ),
        );

    // Get public URL of uploaded file
    final String publicUrl = Supabase.instance.client.storage
        .from('test')
        .getPublicUrl(uniqueFileName);

    return publicUrl;
  } catch (e) {
    print('Error uploading PDF: $e');
    rethrow;
  }
}
