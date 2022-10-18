const FLOAT_REGEX = /^-?\d+(?:\.\d+)?$/;



function funcClick() {
    let xP = document.getElementById("_x");
    const x = parseFloat(xP.options[xP.selectedIndex].value);
    const y = document.getElementById("_y").value;
    const r = document.getElementById("_r").value;

    if(!validationFloat(y)) {
        alert("Y not validation");
        document.getElementById("_y").value = ""
        return;
    }
    if(!domainFloat(parseFloat(y), -5., 3. )) {
        alert("Y value out of bounds");
        document.getElementById("_y").value = ""
        return;

    }
    if(!validationFloat(r)) {
        alert("R not validation");
        document.getElementById("_r").value = ""
        return;
    }
    if(!domainFloat(parseFloat(r), 1., 4. )) {
        alert("R value out of bounds");
        document.getElementById("_r").value = ""
        return;
    }
	// document.getElementById("input-form").submit();
    document.forms["input-form"].submit();
}
function domainFloat(floatNum, leftBorder, rightBorder) {
    if(floatNum >= rightBorder || floatNum <= leftBorder) {
        return false;
    }
    return true;
}

function validationFloat(strFloat) {
    return FLOAT_REGEX.test(strFloat);
}


document.getElementById('input-form').addEventListener('change', () => runGrapher().drawGraph());
document.getElementById('_r').addEventListener('input', () => runGrapher().drawGraph());


