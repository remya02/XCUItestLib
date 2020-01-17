//
//  ReportPortalManager.swift
//  LoginUITests
//
//  Created by Remya Surendran Anjamkudi on 14/01/20.
//  Copyright © 2020 NowTV. All rights reserved.
//

import Foundation

class ReportPortalManager {
    
//    public boolean addStepLog(String stepId, Result status, String message, String screenshot) throws IOException {
//    if (rpenabled && launchSucessfull && !stepId.isEmpty()) {
//
//    String level = "info";
//
//    if (status.equals(Result.FATAL)) {
//    level = "fatal";
//    } else if (status.equals(Result.FAILED)) {
//    level = "error";
//    }
//
//    if (!PropManager.getBoolean("screenShotOn", false)) {
//    if (!status.equals(Result.FAILED) && !status.equals(Result.PASSED) && !status.equals(Result.FATAL)) {
//    screenshot = "";
//    }
//    }
//
//    String logInput = "{" + "\"item_id\": \"" + stepId + "\"," + "\"level\": \"" + level + "\","
//    + "\"message\": \"" + message + "\"," + "\"time\": \"" + formatter.format(new Date()).toString()
//    + "\"}";
//    if (null != screenshot && !screenshot.isEmpty() && !screenshot.equalsIgnoreCase("noLog")) {
//    File ssFile = new File(screenshot);
//    String mimeType = "image/png";
//    if (!ssFile.exists()) {
//    ssFile = convertTextToFile(screenshot);
//    mimeType = "text/plain";
//    }
//
//    logInput = "[{" + "\"file\": {\"name\": \"" + ssFile.getName() + "\"}," + "\"item_id\": \"" + stepId
//    + "\"," + "\"level\": \"" + level + "\"," + "\"message\": \"" + message + "\"," + "\"time\": \""
//    + formatter.format(new Date()).toString() + "\"}]";
//
//    if (ssFile.getName().endsWith(".mov")) {
//    mimeType = "video/quicktime";
//    }
//
//    doHttp.doHttpPost(rpurl + log, ssFile.getAbsolutePath(), logInput, headers, mimeType);
//    return true;
//    }
//
//    System.out.println(logInput);
//    doHttp.doHttpPost(rpurl + log, logInput, false, headers);
//    }
//    return true;
//    }
//
//    public static File convertTextToFile(String text) throws IOException {
//
//    text = text.replace(Character.toString((char) 0), " ");
//    String txtName = ResourceFactory.getScreenshotName("txt");
//    FileUtils.write(new File(txtName), text, Charset.forName("UTF-8"));
//    return new File(txtName);
//
//    }
}
