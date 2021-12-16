import fs from 'fs';

export const readPuzzle = filepath => {

    const input = fs.readFileSync(filepath).toString().split("\r\n")

    // const result_arr = input.map(function (x) {
    //     return parseInt(x, 10);
    // })

    console.log(input)
    return input;
}