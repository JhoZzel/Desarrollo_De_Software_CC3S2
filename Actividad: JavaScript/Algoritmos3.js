function firstCharNotDuplicated(string) {
    var freq = {};
    for (let c of string) {
        if (freq[c]) freq[c]++;
        else freq[c] = 1;
    }
    for (let c of string) {
        if (freq[c] == 1) {
            return c;
        }
    }
    return '';
}

var s = "this is my string"
console.log("My string: ", s);
console.log("First Character Nos Duplicated: ", firstCharNotDuplicated(s));
