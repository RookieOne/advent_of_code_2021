function powerConsumption(input) {

    let bit_1 = null
    let bit_0 = null
    let gamma_rate = []
    let epislon_rate = []

    input.forEach(element => {

        console.log(`Length of our element: ${element.length}`)
        console.log(`Our element: ${element}`)
        if (element[1].startsWith("1")) {

            bit_1++

            console.log(`The bit 1 is : ${bit_1}`)
        }
        if (element[2].startsWith("0")) {

            bit_0++
            console.log(`The bit 0 is : ${bit_0}`)
        }
    })
    if (bit_1 > bit_0) {

        gamma_rate += 1
        console.log(`bit_1 total is: ${bit_1}`)
        console.log(gamma_rate)
    }
    if (bit_0 < bit_1) {
        epislon_rate += 0
        console.log(`bit_0 total is: ${bit_0}`)
        console.log(epislon_rate)

    }
    return zero
}
exports.powerConsumption = powerConsumption