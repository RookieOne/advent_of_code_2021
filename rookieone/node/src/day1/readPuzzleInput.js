import fs from 'fs';

export const readPuzzleInput = filepath => {
  const lines = fs.readFileSync(filepath).toString().split("\n")

  const input = lines.map(line => parseInt(line))

  return input;
}
