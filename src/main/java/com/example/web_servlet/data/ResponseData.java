package com.example.web_servlet.data;

import java.sql.Time;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class ResponseData {
    private final static DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
    private final double x;
    private final double y;
    private final double r;
    private final LocalDateTime attemptTime;
    private final double processTime;
    private final boolean hit;

    public ResponseData(double x, double y, double r, LocalDateTime attemptTime, double processTime, boolean hit) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.attemptTime = attemptTime;
        this.processTime = processTime;
        this.hit = hit;

    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public double getR() {
        return r;
    }

    @Override
    public String toString() {
        return "ResponseData{" +
                "x=" + x +
                ", y=" + y +
                ", r=" + r +
                ", attemptTime=" + attemptTime +
                ", processTime=" + processTime +
                ", hit=" + hit +
                "}\n";
    }
    public String block() {
        return
                "<td class=\"xResult\">" + x + "</td>" +
                "<td class=\"yResult\">" + y + "</td>" +
                "<td class=\"rResult\">" + r + "</td>" +
                "<td>" + attemptTime.format(formatter) + "</td>" +
                "<td>" + processTime/1000 + "ms" + "</td>" +
                "<td>" + (hit ? "HIT" : "MISS") + "</td>"
                ;
    }
}
