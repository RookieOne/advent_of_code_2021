import fs from 'fs';

const input = [
    199,
    200,
    208,
    210,
    200,
    207,
    240,
    269,
    260,
    263
]

//Find what is greater in report
function countGreater(report_array) {
    var total_increase = 0

    for (var i = 0; i < report_array.length; i++) {
        if (report_array[i] < report_array[i + 1]) 
        {
            total_increase += 1
        }
    }
    return total_increase
}

// function groupGreater(report_array) {
    
    
//     var total_increase = 0;
//     var groupList = [];
//     var currentDepth = input[i];
//     var currentDepthSum;
//     var previousDepth = null

//     //[123, 234, 120] = 477
//     //So group A = 477
//     for (var i = 0; i < report_array.length; i++) {
        
//         currentDepth = input[i]

//         if (groupList.length < 3) {
//             groupList.push(currentDepth)
//         } else {
//             currentDepthSum = currentDepthWindow[0] + currentDepthWindow[1] + currentDepthWindow[2]
//         }
//         if (!previousDepth) {
//             previousDepth = currentDepthSum
//         } else {
//             console.log("Here")
//         }
//         console.log(currentDepthSum, currentDepthWindow, previousDepth)
//     }
//     return total_increase
// }

export const readPuzzleInput = filepath => {
    const input = fs.readFileSync(filepath).toString().split("\n")

    const mapped = input.map( x => parseInt(x));

    return mapped

}

exports.countGreater = countGreater