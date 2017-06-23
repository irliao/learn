[1, 2, 3].map(x => x * 2) === [2,4,6]

// map :: (a -> b) -> [a] -> [b]

// reduce :: (a -> b -> c) -> [a] -> b -> c


let list = [1, 2, 3, 4, 5];

let mappedList = _.map(list, a => a * 2);
// mappedList === [2,4,6]

let initialValue = [];
let appendToList = (acc, a) => acc.append(a * 2);
let reducedList = _.reduce(list, appendToList, initialValue)


function(a,b) { return a };  === (a, b) => a
