import fs from 'fs';

// Example Input
// forward 5
// down 5
// forward 8
// up 3
// down 8
// forward 2
// Example Output (readPuzzle)
// arr = [
//     "forward " , 5,
//     "down " , 5,
//     "forward " , 8, 
// ]

export const readPuzzle = filepath => {

    const input = fs.readFileSync(filepath).toString().replace(/(\r\n|\n|\r)/gm, "").split(/(\d+)/)

    let arr = [];
    let split = input
    //For each index in the split
    for (let i in split) {

        //s is our split index
        let s = split[i];
        // If s is not empty
        if (s !== "") {
            //If the index is a divisble by 1 (so a number)
            if (i % 2) {
                //push the array, and make number as int
                arr.push(+s);
                //otherwise we expect it to be a string
            } else {
                arr.push(s);
            }
        }
    }
    return arr;
}