function to_roman(_num) {
    var result = "";
    
    var values = [1000, 900, 500, 400, 100, 90,  50, 40,  10, 9,  5, 4, 1];
    var romans = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];
    
    for (var i = 0; i < array_length(values); i++) {
        while (_num >= values[i]) {
            _num -= values[i];
            result += romans[i];
        }
    }
    
    return result;
}
