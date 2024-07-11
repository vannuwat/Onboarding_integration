package com.example.onboarding_integration;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "samples.flutter.dev/battery";
  private static final int REQUEST_CODE = 1;
  private MethodChannel.Result pendingResult;

  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    super.configureFlutterEngine(flutterEngine);
    new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
        .setMethodCallHandler(
          (call, result) -> {
            if (call.method.equals("launchApp")) {
              String launchUri = call.argument("launchUri");
              if (launchUri != null) {
                launchApp(launchUri, result);
              } else {
                result.error("INVALID_LAUNCH_URI", "launchUri is null", null);
              }
            } else {
              result.notImplemented();
            }
          }
        );
  }

  private void launchApp(String launchUri, MethodChannel.Result result) {
    try {
      Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(launchUri));
      if (intent.resolveActivity(getPackageManager()) != null) {
        pendingResult = result;
        startActivityForResult(intent, REQUEST_CODE);
      } else {
        result.error("APP_NOT_FOUND", "No app found to handle the launchUri", null);
      }
    } catch (Exception e) {
      result.error("ERROR", "Failed to launch app: " + e.getMessage(), null);
    }
  }

  @Override
  protected void onActivityResult(int requestCode, int resultCode, Intent data) {
    super.onActivityResult(requestCode, resultCode, data);
    if (requestCode == REQUEST_CODE) {
      if (pendingResult != null) {
        if (resultCode == RESULT_OK) {
          pendingResult.success("App launched successfully with result: " + resultCode);
        } else {
          pendingResult.error("ERROR", "App launched but did not return RESULT_OK", null);
        }
        pendingResult = null;
      }
    }
  }
}
