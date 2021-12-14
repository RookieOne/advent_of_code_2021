import { measureDepthIncreases } from "./part1";

const sumDepthWindow = depthWindow => {
  return depthWindow[0] + depthWindow[1] + depthWindow[2]
}

export const measureDepthWindowIncreases = input => {
  let currentDepthWindow = [];
  let currentDepth;
  let currentDepthSum;
  let depthWindows = [];

  for (var i = 0; i < input.length; i++) {
    currentDepth = input[i]

    currentDepthSum = sumDepthWindow(currentDepthWindow)

    currentDepthWindow[0] = currentDepthWindow[1]
    currentDepthWindow[1] = currentDepthWindow[2]
    currentDepthWindow[2] = currentDepth

    if (currentDepthSum) {
      depthWindows.push(currentDepthSum)
    }
  }

  currentDepthSum = sumDepthWindow(currentDepthWindow)

  depthWindows.push(currentDepthSum)

  return measureDepthIncreases(depthWindows)
}
