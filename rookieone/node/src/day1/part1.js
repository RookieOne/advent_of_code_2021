import _ from 'lodash';

export const measureDepthIncreases = input => {
  const result = _.reduce(input, (acc, depth) => {

    if (!_.isNil(acc.previousDepth) && acc.previousDepth < depth) {
      acc.numberOfIncreases++;
    }
    acc.previousDepth = depth;

    return acc
  }, {
    previousDepth: null,
    numberOfIncreases: 0
  })

  return result.numberOfIncreases
}
