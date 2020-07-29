package com.aiotdelivery.tools;

import static java.lang.Thread.sleep;

public class SendMessage {
    private static final String testJSONstr =
            "{\"Attr1\":\"Value1\",\"Attr2\":\"Value2\",\"Attr3\":\"Value3\"}";

    public static void send() throws InterruptedException {
        int count = 0;
        while (count < 1000) {
            count++;
            System.out.print(count+":");
            System.out.println(testJSONstr);
            sleep(1000);
        }
    }
}
