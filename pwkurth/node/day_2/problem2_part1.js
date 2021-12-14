function horizontalDepth(input) {

    let horizontal_position = 0
    let increase_depth_position = 0
    let decrease_depth_position = 0
    let aim = 0

    for (var i = 0; i < input.length; i++) {
        if (input[i] === "forward ") {
            horizontal_position += input[i + 1]
        }

        if (input[i] === "down ") {
            //If its down, itll take the next index
            //Ex if it's 5
            //increase_depth = 5
            //But we still need to keep adding..
            increase_depth_position += input[i + 1]
        }
        if (input[i] === "up ") {
            decrease_depth_position += input[i + 1]
        }
    }
    let depth_position = increase_depth_position - decrease_depth_position
    let total_position = depth_position * horizontal_position
    return total_position
}
exports.horizontalDepth = horizontalDepth