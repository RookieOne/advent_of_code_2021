import assert from 'assert';
import { powerConsumption } from './problem3_part1';
import { readPuzzle } from './readPuzzle';


describe("Day 3", () => {
    describe("Problem 3 Part 1", () => {
        it.only("Return the answer from the input", () => {
            const input = readPuzzle("./day_3/puzzle_reports_test.txt")
            const answer = powerConsumption(input)

            assert.equal(answer, 198)
        })
    })

    // describe("Problem 3 Part 3", () => {
    //     it.only("Return the answer from the input", () => {
    //         const input = readPuzzle("./src/day3/puzzle_reports.txt")
    //         const answer = powerConsumption(input)

    //         assert.equal(answer, 1592426537)
    //     })
    // })
})