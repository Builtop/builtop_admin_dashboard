import 'package:builtop_admin_dashboard/constants/const.dart';
import 'package:builtop_admin_dashboard/constants/numbers.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:mahg_essential_package/mahg_essential_package.dart';

class AdminUsersService {
  static final ApiService _apiService = ApiService();
  static const String _url = 'http://64.225.91.35:8080/api/users/';

  static Future<ProcessResult> approveUser(String id) async {
    try {
      var result =
          await _apiService.httpPutEx('${_url}approve-account', {"_id": id});
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }

  static Future<ProcessResult> getUser(String id) async {
    try {
      var result = await _apiService.httpGetDynamic(
        '${_url}user/$id',
      );
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }

  static Future<ProcessResult> activateUser(String id) async {
    try {
      var result =
          await _apiService.httpPutEx('${_url}activate-account', {"_id": id});
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }

  static Future<ProcessResult> deActivateUser(String id) async {
    try {
      var result =
          await _apiService.httpPutEx('${_url}deactivate-account', {"_id": id});
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }

  static Future<ProcessResult> changePassword(String id,
      {required String currentPassword, required String newPassword}) async {
    try {
      var result = await _apiService.httpPutEx('${_url}change-password', {
        "_id": id,
        "currentPassword": currentPassword,
        "newPassword": newPassword
      });
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }

  static Future<ProcessResult> _deleteUser(String id) async {
    try {
      var result = await _apiService.httpDeleteDynamicEx('${_url}user/$id');
      return result;
    } catch (e) {
      return ProcessResult(success: false, errorMessage: e.toString());
    }
  }

  static Future<void> deleteUserEx(
      {required BuildContext context,
      required String id,
      required int returnToIndex}) async {
    try {
      bool? confirm;
      await CoolAlert.show(
          width: NumbersConst.dialogWidth,
          context: context,
          type: CoolAlertType.confirm,
          onConfirmBtnTap: () {
            confirm = true;
          },
          onCancelBtnTap: () {
            confirm = false;
          },
          title: 'Are you sure you want to delete ?');

      if (confirm ?? false) {
        if (!context.mounted) return;
        var result = await LoadingOverlay.showFutureLoadingDialog(
            context: context, future: () => _deleteUser(id));

        if (result.result?.success ?? false) {
          if (!context.mounted) return;

          CoolAlert.show(
                  width: NumbersConst.dialogWidth,
                  context: context,
                  type: CoolAlertType.success,
                  text: 'User Deleted Successfully')
              .then((value) => autoTabRouter?.setActiveIndex(returnToIndex));
        } else {
          if (!context.mounted) return;

          CoolAlert.show(
              width: NumbersConst.dialogWidth,
              context: context,
              type: CoolAlertType.error,
              text: result.result?.errorMessage);
        }
      }
    } catch (e) {
      CoolAlert.show(
          width: NumbersConst.dialogWidth,
          context: context,
          type: CoolAlertType.error,
          text: e.toString());
    }
  }
}
