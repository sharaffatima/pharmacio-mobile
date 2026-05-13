import 'package:dio/dio.dart';

class Failure {
  final int? statusCode;
  final String message;

  Failure({this.statusCode, required this.message});
  //?----------------------------------------------------------------------------

  //* handele Error
  factory Failure.handleError(dynamic exception) {
    if (exception is! DioException) {
      // If it's not a DioException, try to extract a meaningful message
      if (exception is Exception || exception is Error) {
        return Failure(statusCode: -1, message: exception.toString());
      }
      return Failure(
        statusCode: -1,
        message: 'An unexpected error occurred: ${exception.toString()}',
      );
    }

    final status = exception.response?.statusCode ?? -1;
    final data = exception.response?.data;

    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return Failure(
          statusCode: status,
          message: 'Connection Timeout, please try again',
        );

      case DioExceptionType.sendTimeout:
        return Failure(
          statusCode: status,
          message: 'Send Timeout, please try again',
        );

      case DioExceptionType.receiveTimeout:
        return Failure(
          statusCode: status,
          message: 'Receive Timeout, please try again',
        );

      case DioExceptionType.badCertificate:
        return Failure(statusCode: status, message: 'Bad SSL Certificate');

      case DioExceptionType.badResponse:
        if (data != null) {
          String? errorMsg;

          // Handle when data is a List (like ["Invalid or expired code"])
          if (data is List && data.isNotEmpty) {
            errorMsg = data.first.toString();
          }
          // Handle when data is a Map<String, dynamic>
          else if (data is Map<String, dynamic> && data.isNotEmpty) {
            // Extract error message from common error fields
            if (data.containsKey('non_field_errors') &&
                data['non_field_errors'] is List &&
                (data['non_field_errors'] as List).isNotEmpty) {
              errorMsg = (data['non_field_errors'] as List).first.toString();
            } else if (data.containsKey('detail') && data['detail'] != null) {
              errorMsg = data['detail'].toString();
            } else if (data.containsKey('message') && data['message'] != null) {
              errorMsg = data['message'].toString();
            } else {
              // Handle field-specific errors like {"email": "Email already exists"}
              final fieldErrors = <String>[];
              data.forEach((key, value) {
                if (value is String) {
                  fieldErrors.add(value);
                } else if (value is List && value.isNotEmpty) {
                  fieldErrors.add(value.first.toString());
                }
              });

              if (fieldErrors.isNotEmpty) {
                errorMsg = fieldErrors.join(', ');
              } else {
                errorMsg = 'Something went wrong, please try again.';
              }
            }
          } else {
            errorMsg = 'Something went wrong, please try again.';
          }

          return Failure(statusCode: status, message: errorMsg);
        } else {
          //* If data is null or empty
          switch (status) {
            case 400:
              return Failure(statusCode: status, message: 'Invalid request');

            case 401:
              return Failure(
                statusCode: status,
                message: 'Unauthorized access, please login again',
              );

            case 404:
              return Failure(statusCode: status, message: 'Resource not found');

            case 422:
              return Failure(statusCode: status, message: 'Validation error');

            case 500:
              return Failure(statusCode: status, message: 'Server Error');

            case 403:
              return Failure(
                statusCode: status,
                message: 'You don’t have permission to perform this action',
              );

            default:
              return Failure(
                statusCode: status,
                message: 'Something went wrong, please try again.',
              );
          }
        }

      case DioExceptionType.cancel:
        return Failure(
          statusCode: status,
          message: 'Request was cancelled by user',
        );

      case DioExceptionType.connectionError:
        return Failure(
          statusCode: status,
          message: 'Connection error, please check your internet',
        );

      case DioExceptionType.unknown:
        return Failure(statusCode: status, message: 'Unknown error occurred');
    }
  }
}

//?-----------------------------------------------------------------------------------
//?--------       Type Failure          ----------------------------------------------
//?-----------------------------------------------------------------------------------

//* Refresh
class FailureRefresh extends Failure {
  FailureRefresh({super.message = 'Refresh failed'});
}

//?-------------------------------------------------

//* Wrong
class FailureWrong extends Failure {
  FailureWrong({super.message = 'An error occurred!'});
}
//?-------------------------------------------------

//* Server
class FailureServer extends Failure {
  FailureServer({super.message = 'Server error!'});
}
//?-------------------------------------------------

//* No Data ( Empty )
class FailureNoData extends Failure {
  FailureNoData({super.message = 'No Data'});
}
//?-------------------------------------------------

//* No Connection
class FailureNoConnection extends Failure {
  FailureNoConnection({super.message = 'No Connection , Pleas Try Agen'});
}
//?-------------------------------------------------

//?-------------------------------------------------
