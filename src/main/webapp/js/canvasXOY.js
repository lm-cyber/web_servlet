
const canvas = document.getElementById("graph");
let w = canvas.width, h = canvas.height;

const hatchWidth = 20 / 2;
const baseHatchGap=30;
var hatchGap = 20;
var rValue = 1;

function runGrapher() {
    const width = canvas.width;
    const height = canvas.height;
    const ctx = canvas.getContext("2d");

    const FIGURE_COLOR = "#567efb99";
    const points = [];

    function drawGraph() {
        ctx.font = "13px sans-serif";
        ctx.fillStyle = "#FFF";
        ctx.fillRect(0, 0, width, height);

        ctx.fillStyle = FIGURE_COLOR;
        // 1st quadrant triangle
        ctx.beginPath();
        ctx.moveTo(width / 2, height / 3);
        ctx.lineTo(width / 6 * 5, height / 2);
        ctx.lineTo(width / 2, height / 2);
        ctx.fill();

        ctx.beginPath();
        ctx.moveTo(0, height / 2);
        ctx.lineTo(width, height / 2);
        ctx.lineTo(width - 10, height / 2 - 10);
        ctx.moveTo(width, height / 2);
        ctx.lineTo(width - 10, height / 2 + 10);
        ctx.stroke();

        ctx.beginPath();
        ctx.moveTo(width / 2, height);
        ctx.lineTo(width / 2, 0);
        ctx.lineTo(width / 2 - 10, 10);
        ctx.moveTo(width / 2, 0);
        ctx.lineTo(width / 2 + 10, 10);
        ctx.stroke();

        // 2nd quadrant sector
        ctx.beginPath();
        ctx.arc(width / 2, height / 2, width / 6, 0, Math.PI/2, false);
        ctx.lineTo(width / 2, height / 2);
        ctx.fill();

        // 4th quadrant rectangl
        ctx.fillRect(width / 6,  height / 6, width / 3 , height / 3);


        ctx.fillStyle = "#000";
        const labels = ["-R", "-R/2", "0", "R/2", "R"];

        for (let i = 1; i < 6; i++) {
            ctx.beginPath();
            ctx.moveTo((i * width) / 6, height / 2 - 5);
            ctx.lineTo((i * width) / 6, height / 2 + 5);
            ctx.moveTo(width / 2 - 5, (i * height) / 6);
            ctx.lineTo(width / 2 + 5, (i * height) / 6);
            ctx.stroke();

            ctx.textAlign = "center";
            ctx.textBaseline = "bottom";
            ctx.fillText(labels[i - 1], (i * width) / 6, height / 2 - 7);

            ctx.textAlign = "left";
            ctx.textBaseline = "middle";
            ctx.fillText(labels[i - 1], width / 2 + 7, height - (i * height) / 6);
        }

        const r = getR();

        points.forEach((point, index) => {
            const x = ((point.x / r) * width) / 3 + width / 2;
            const y = ((-point.y / r) * height) / 3 + height / 2;

            ctx.fillStyle = point.color;
            ctx.beginPath();
            ctx.arc(x, y, 5, 0, Math.PI * 2);
            ctx.fill();
        });
    }


    return {
        drawGraph,
    };
}
function getR() {
    const r = document.getElementById("_r").value;


    return r;
}

runGrapher().drawGraph();
function getMousePosition(e) {
    var rect = canvas.getBoundingClientRect();

    var mouseX = e.offsetX * canvas.width / canvas.clientWidth | 0;
    var mouseY = e.offsetY * canvas.height / canvas.clientHeight | 0;
    return {x: mouseX, y: mouseY};
}


canvas.addEventListener('click', (event) => {
    if (!isNaN(getR())&&validationFloat(getR())) {
        const x = getMousePosition(event).x;
        const y = getMousePosition(event).y;
        const xCenter = Math.round((x - w/2) / (hatchGap * (2/rValue))*1000)/1000,
            yCenter = Math.round((h/2 - y) / (hatchGap * (2/rValue))*1000)/1000;
        console.log(xCenter, yCenter);

        if(xCenter>2||xCenter<-2) {
            alert("x coordinate out of range(-2,2)");
            return;
        }
        if(yCenter>3||yCenter<-5) {
            alert("y coordinate out of range(-5,3)");
            return;
        }
        const params = {
            'x_coordinate' : xCenter,
            'y_coordinate': yCenter,
            'r_coordinate': getR(),
            'timezone': new Date().getTimezoneOffset()
        }

        let xP = document.getElementById("_x");
        xP.options[xP.selectedIndex].value = xCenter.toString();
        document.getElementById("_y").value = yCenter.toString();

        document.forms["input-form"].submit();

    } else {
        alert("Error: R field is incorrect!")
    }
});

