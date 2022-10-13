package com.example.web_servlet.data;

import java.sql.Time;
import java.time.LocalDateTime;
import java.util.Date;

public class ResponseData {
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
}
