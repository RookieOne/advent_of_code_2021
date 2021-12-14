import assert from 'assert';
import { horizontalDepth } from './problem2_part1';
import { horizontalPosition } from './problem2_part2'
import { readPuzzle } from './readPuzzle';

describe("Day 2", () => {
    describe("Problem 2 Part 1", () => {
        it("Return the answer from the input", () => {
            const input = readPuzzle("./day_2/puzzle_reports.txt")
            const answer = horizontalDepth(input)

            assert.equal(answer, 1524750)
        })
    })

    describe("Problem 2 Part 2", () => {
        it("Return the answer from the input", () => {
            const input = readPuzzle("./day_2/puzzle_reports.txt")
            const answer = horizontalPosition(input)

            assert.equal(answer, 1592426537)
        })
    })
})