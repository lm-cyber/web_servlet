package com.example.web_servlet;

public class CheckZone {

    //hardcode
    //refactor after
    public static boolean checkAria (Double x,Double y,Double r) {

        boolean a = false;

        a |= x > -r && x < 0 && y > 0 && y < r;
        a |= x > 0 && y < 0 && ((x * x + y * y) < (r * r / 4));
        a |= x > 0 && y > 0 && (y < (r / 2 - x / 2));
        return a;

    }
}
