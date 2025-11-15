function pickForMe(...choices){
    selection = getRandomNumber(0, (choices.length));
    return choices[selection];
}

function getRandomNumber(min, max){
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor((Math.random() * (max - min) + min)).toFixed(0);
}