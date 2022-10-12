
function runGrapher() {
    const canvas = document.getElementById("graph");
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

runGrapher().drawGraph();