package com.aiotdelivery.tools;

public class TestSend {
    public static void main(String[] args) {
        try {
            SendMessage.send();
        } catch (InterruptedException e) {
            System.out.println("catch InterruptedException:");
            e.printStackTrace();
        } finally {
            System.out.println("test over.");
        }
    }
}
