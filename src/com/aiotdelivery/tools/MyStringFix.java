package com.aiotdelivery.tools;

public class MyStringFix {
    public static String addZero(String numString, int length) {
        String zeroString = numString;
        int zeroNum = Math.max(length - numString.length(), 0);
        String zeros = String.format("%0" + zeroNum + "d", 0);

        if (zeroString.length() < length) {
            zeroString = zeros + numString;
        }
        return zeroString;
    }

    public static String cutUserName(String username) {
        // username@testmail.com => username
        return username.split("@")[0];
    }

    public static String phoneDashRemove(String phone) {
        return phone.replace("-", "");
    }
    
    public static String phoneDashAdd(String phone) {
        phone = phone.replace("-", "");
        return phone.substring(0,4)+"-"+phone.substring(4,7)+"-"+phone.substring(7,10);
    }
    
    public static void main(String[] args) {
        System.out.println(phoneDashAdd("0912345678"));
    }

}
