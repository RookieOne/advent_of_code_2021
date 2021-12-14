function horizontalPosition(input) {

    let total_aim = 0
    let total_depth = 0
    let horizontal_position = 0
    let inital_aim = 1
    let increase_aim = 0
    let decrease_aim = 0
    let new_total_depth = 0

    for (var i = 0; i < input.length; i++) {
        if (input[i] === "forward ") {

            //First forward adds us 5 to our position
            horizontal_position += input[i + 1]

            //Our inital aim is set to 1, because their is no inital aim (0)
            if (inital_aim === 1) {
                //So we take our position and times it by 1 forward 5 adds 5 but no aim
                total_depth = horizontal_position * 1
            }
            //If our initial_aim isn't 1 (which will be the case after the first if)
            //Take our horizontal_position * total_aim
            //Problem, we only want that first number, NOT the total (horizonotal_position)
            //So create new variable, that adds the total_depth
            else if (inital_aim != 1) {
                total_depth = input[i + 1] * total_aim
                new_total_depth += total_depth
            }
            else {
                horizontal_position += input[i + 1]
            }
        }
        if (input[i] === "down ") {
            //We don't need to worry about position with down or up, it just affects aim now
            increase_aim += input[i + 1]
            total_aim += increase_aim
            //If it hits down or up, increase inital aim so it stops going to our nested if statement
            inital_aim += 1
        }
        if (input[i] === "up ") {
            decrease_aim += input[i + 1]
            inital_aim += 1
        }
        total_aim = increase_aim - decrease_aim
    }
    total_depth = horizontal_position * new_total_depth
    return total_depth
}

exports.horizontalPosition = horizontalPosition