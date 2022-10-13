package com.example.web_servlet.data;

import com.sun.source.tree.DoWhileLoopTree;

public class Validator {
    private final Double minX, maxX;
    private final Double minY, maxY;
    private final Double minR, maxR;

    public Validator(Double minX, Double maxX, Double minY, Double maxY, Double minR, Double maxR) {
        this.minX = minX;
        this.maxX = maxX;
        this.minY = minY;
        this.maxY = maxY;
        this.minR = minR;
        this.maxR = maxR;
    }

    public boolean validate(Double x, Double y, Double r) {
        return x < maxX && x > minX && y < maxY && y > minY && r < maxR && r > minR;
    }
}
