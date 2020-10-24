package com.gokul.root;

import java.util.List;
import android.app.Activity;
import android.content.Context;
import com.stericson.RootTools.RootTools;
import com.topjohnwu.superuser.Shell;
import com.topjohnwu.superuser.ShellUtils;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** RootPlugin */
public class RootPlugin implements MethodCallHandler {

  MethodChannel methodChannel;
  Context context;
  List<String> text;
  String cmd;
  StringBuilder stringBuilder;


  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(),"root");
    channel.setMethodCallHandler(new RootPlugin(registrar.activity(),channel));
  }
  public RootPlugin(Activity activity, MethodChannel methodChannel){
    this.context=activity;
    this.methodChannel=methodChannel;
    this.methodChannel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("ExecuteCommand")) {
       cmd=call.argument("cmd");
       text=Shell.sh(cmd).exec().getOut();
       stringBuilder=new StringBuilder();
      for(String data : text){
        stringBuilder.append(data);
        stringBuilder.append("\n");
       }
      result.success(String.format("%s",stringBuilder));
    } else if(call.method.equals("isRooted")){
      result.success(isRooted());
    } else{
      result.notImplemented();
    }


  }
  private boolean isRooted() {
    return RootTools.isAccessGiven();
  }

}
