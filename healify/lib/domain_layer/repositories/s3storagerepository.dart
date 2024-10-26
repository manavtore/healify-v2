// ignore_for_file: non_constant_identifier_names

import 'package:healify/data_layer/constants/env.dart';
import 'package:s3_storage/io.dart';
import 'package:s3_storage/s3_storage.dart';

class S3Operations{
  final String bucketName = env.BUCKET_NAME;
  final s3_storage = S3Storage(
    endPoint: 's3.amazonaws.com',
    accessKey: env.ACCESS_KEY,
    secretKey:  env.SECRET_ACCESS_KEY,
  );


  Future<void> uploadFile(String filePath, String fileName) async {
    await s3_storage.fPutObject(
      bucketName,
      filePath,
      fileName,
    );
  }

  Future<void> downloadFile(String filePath, String fileName) async {
    await s3_storage.fGetObject(
      bucketName,
      filePath,
      fileName,
    );
  }


}