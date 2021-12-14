import assert from 'assert';

import { countGreater } from './problem1';
import { readPuzzleInput } from './problem1';
import { groupIncrease } from './problem1_part2';

describe("Day 1", () => {
    describe("Problem 1", () => {
        it("Should be 7", () => {
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

            const answer = countGreater(input)

            assert.equal(answer, 7)
        
        })
        it("Return the answer from the input", () => {
            const input = readPuzzleInput("./src/day1/puzzle_reports.txt")

            const answer = groupIncrease(input)

            assert.equal(answer, 1262)
        })
        describe("Day 1 - Part 2", () => {
            describe("Problem 1 - Part 2", () => {
                it.only("Should be 5", () =>{
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

                    const answer = groupIncrease(input)
                    assert.equal(answer, 5)
                })
            })
        })
    })
})