import assert from 'assert';

import { measureDepthIncreases } from './part1';
import { readPuzzleInput } from './readPuzzleInput';

describe("Day 1", () => {
  describe("Part 1", () => {
    it("example should return answer", () => {
      const input = readPuzzleInput('./src/day1/example.txt')

      const answer = measureDepthIncreases(input)

      assert.equal(answer, 7)
    })

    it("input should return answer", () => {
      const input = readPuzzleInput('./src/day1/input.txt')

      const answer = measureDepthIncreases(input)

      assert.equal(answer, 1791)
    })
  })
})
