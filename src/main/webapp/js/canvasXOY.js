
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
function getR() {
    let r = 0;

    const form = document.getElementById('form');

    if (form) {
        const formData = new FormData(form);
        const parsedR = parseFloat(formData.get('r'));
        r = (isNaN(parsedR) ? 0 : parsedR);
    } else if (POINTS.length > 0) {
        r = POINTS[0].r;
    }

    return r;
}

runGrapher().drawGraph();
if (canvas.ariaDisabled !== 'true') {
    canvas.addEventListener('mousedown', (ev) => {
        const r = getR();
        if (r === 0) {
            alert('Please select R first');
            return;
        }

        const x = Math.round((ev.offsetX / canvas.width - 0.5) * 3 * r * 100) / 100;
        const y = Math.round((ev.offsetY / canvas.height - 0.5) * -3 * r * 100) / 100;

        const form = document.getElementById('form');

        // If one or both form inputs are selections, we will need a
        // hidden option that contains the graph click value.
        if (document.getElementById('input-x')) document.getElementById('input-x').value = x;
        form['x'].value = x;
        if (document.getElementById('input-y')) document.getElementById('input-y').value = y;
        form['y'].value = y;

        form.submit();
    });

    canvas.addEventListener('mousemove', (ev) => {
        renderGraph();
        ctx.fillStyle = `rgb(${themeColor[0]}, ${themeColor[1]}, ${themeColor[2]})`;
        ctx.beginPath();
        ctx.arc(ev.offsetX, ev.offsetY, 5, 0, Math.PI * 2);
        ctx.fill();
    });

    canvas.addEventListener('mouseleave', renderGraph);

    document.getElementById('form').addEventListener('change', renderGraph);
}
