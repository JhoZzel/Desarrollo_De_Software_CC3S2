function containsX(string) {
    foundX = false;
    for(let i = 0; i < string.length; i++) {
        if (string[i] === "X") {
            foundX = true;
         }
   }
    return foundX;
}

function optimizedContainsX(string) {
    for (let c of string) {
        if (c == 'X') {
            return true;
        }
    }
    return false;
}

var s = "Hello my name is Ximena"
console.log("My string: ", s);
console.log("Contains X? O(n^2): ", containsX(s));
console.log("Contains X? O(n):   ", optimizedContainsX(s));
