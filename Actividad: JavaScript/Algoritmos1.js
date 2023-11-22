function greatestNumber(array) {
    for (let i of array) {
        let isIValTheGreatest = true;
        for (let j of array) {
            if (j > i) {
                isIValTheGreatest = false;
            }
        }
        if (isIValTheGreatest) {
            return i;
        }
    }
}

function optimizedGreatestNumber(array) {
    var v_max = array[0];
    for (let number of array) {
        if (number > v_max) {
            v_max = number;
        }
    }
    return v_max;
}

const a = [5, 10, 3, 8, 2];
console.log("My array: ", a);
console.log("Greatest Number O(n^2): ", greatestNumber(a));
console.log("Greatest Number O(n):   ", optimizedGreatestNumber(a));
