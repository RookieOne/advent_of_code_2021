import fs from 'fs';

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