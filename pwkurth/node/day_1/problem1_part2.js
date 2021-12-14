import { countGreater } from './problem1';

const report_array = [
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

function groupIncrease(report_array) {

    //Array to hold our group depth
    let groupDepth = [];
    let groupDepthTotal = [];
    let totalDepthTotal = [];
    let groupDepthNumbers = [];
    for (var i = 0; i < report_array.length; i++) {
        //The current depth should be equal to what our for loop is in
        let currentDepth = report_array[i];

        //If our groupDepth is less than 3
        //We need to add that into our groupDepth
        if (groupDepth.length < 3) {
            //Use puth method to add elements to the array
            groupDepth.push(currentDepth)
        } else {

            //We get total of groupDepth (But only for A)
            groupDepthTotal.push(groupDepth[0] + groupDepth[1] + groupDepth[2])

            //Now we need to shift the index around somehow
            groupDepth[0] = groupDepth[1]
            groupDepth[1] = groupDepth[2]
            groupDepth[2] = currentDepth

        }

    }
    totalDepthTotal = groupDepthTotal
    groupDepthTotal.push(groupDepth[0] + groupDepth[1] + groupDepth[2])
    groupDepthNumbers = groupDepthTotal
    return countGreater(groupDepthNumbers)
}

exports.groupIncrease = groupIncrease;