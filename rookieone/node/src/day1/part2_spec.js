import assert from 'assert';

import { measureDepthWindowIncreases } from './part2';
import { readPuzzleInput } from './readPuzzleInput';

describe("Day 1", () => {
  describe("Part 2", () => {
    it("example should return answer", () => {
      const input = readPuzzleInput('./src/day1/example.txt')

      const answer = measureDepthWindowIncreases(input)

      assert.equal(answer, 5)
    })

    it("input should return answer", () => {
      const input = readPuzzleInput('./src/day1/input.txt')

      const answer = measureDepthWindowIncreases(input)

      assert.equal(answer, 1822)
    })
  })
})
