function beerSong(counter) {
  if (counter == 0) {
    console.log("No more bottles of beer on the wall, no more bottles of beer.");
    console.log("Go to the store and buy some more, 99 bottles of beer on the wall.");
    return; 
  }

  console.log(counter + " bottles of beer on the wall, " + counter + " bottles of beer.");

  if (counter == 1) {
    console.log("Take it down and pass it around, no more bottles of beer on the wall.");
  } else {
    console.log("Take one down and pass it around, " + (counter - 1) + " bottles of beer on the wall."); 
  }
  beerSong(counter - 1);
}

beerSong(99);
