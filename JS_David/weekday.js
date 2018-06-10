//weekday kata
const weekdaysNames = ['Hétfő', 'Kedd', 'Szerda', 'Csütörtök', 'Péntek', 'Szombat', 'Vasárnap'];
const months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

const refDate = {
    year: 2018,
    month: 6,
    day: 8,
    weekday: 4
    //0 - hétfő, ..., 6 - vasárnap
};

function isSzoko(year) {
    if (year % 4 == 0 && year % 400 != 0) return true;
    return false;
}

function dayOfYear(year, month, day) {
    var all = 0;
    for (var i=0; i<month-1; i++){
        all += months[i];
        if (i==1 && isSzoko(year)) all++;
    }
    all += day;
    return all;
}


function yearDiff(year) {
    var sign = Math.sign(year - refDate.year);
    var days = 0;
    for (var i = Math.min(year, refDate.year); i<Math.max(year, refDate.year); i++) {
        days += sign*365;
        if (isSzoko(i)) days += sign;
    }
    return days;
}

function weekday(year, month, day) {
    var diff = dayOfYear(year, month, day) - dayOfYear(refDate.year, refDate.month, refDate.day) + yearDiff(year);
    //Negatív számokra -6...-1-et dobott, ez ennek javítására szolgál:     
    var mod = diff > 0 ? diff % 7 : (7 + diff) % 7;

    return weekdaysNames[(mod + refDate.weekday) % 7];
}

//Ildi nyomán:
function test(s1, s2){
    if (s1 != s2) console.log(s1, '!=', s2);
}

test(weekday(2018, 6, 4), 'Hétfő');
test(weekday(2018, 6, 8), 'Péntek');
test(weekday(2018, 6, 24), 'Vasárnap');

test(weekday(2018, 6, 1), 'Péntek');
test(weekday(2017, 11, 1), 'Szerda');
test(weekday(2016, 3, 10), 'Csütörtök');
test(weekday(2016, 2, 9), 'Kedd');

test(weekday(2020, 2, 9), 'Vasárnap');
test(weekday(2020, 3, 1), 'Vasárnap');
test(weekday(2028, 2, 29), 'Kedd');
test(weekday(2028, 3, 2), 'Csütörtök');
test(weekday(2019, 7, 11), 'Csütörtök');