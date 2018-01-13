var _ = require("lodadsh");

// TODO: sort word first, then compare

function anagram(word, possibleAnagrams) {
  var wordArray = word.split('');
  var result = [];
  var charDict = _.reduce(wordArray, (acc, x) => {
    acc[x] = acc[x] === undefined ? 1 : (acc[x] + 1);
    return acc;
  }, {});

  // _.map(possibleAnagrams, function(possibleAnagram) {
     
  // });
    
}
