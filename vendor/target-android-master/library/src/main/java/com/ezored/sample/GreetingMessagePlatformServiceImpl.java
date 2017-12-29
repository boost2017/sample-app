package com.ezored.sample;

import android.content.Context;
import android.content.DialogInterface;
import android.support.v4.app.ActivityManagerCompat;
import android.support.v7.app.AlertDialog;

/** Platform-Specific implementation of Greeting Message Platform Service class */
public class GreetingMessagePlatformServiceImpl extends GreetingMessagePlatformService {

	private Context context;

	public GreetingMessagePlatformServiceImpl(Context context) {
		this.context = context;
	}

	public void showGreetingMessageAlert(String title, String message) {
		AlertDialog.Builder builder = new AlertDialog.Builder(context);

		builder.setTitle(title);
		builder.setMessage(message);
		builder.setNegativeButton("OK", new DialogInterface.OnClickListener() {
			public void onClick(DialogInterface dialog, int id) {
				dialog.dismiss();
			}
		});

		builder.create().show();
	}

}
