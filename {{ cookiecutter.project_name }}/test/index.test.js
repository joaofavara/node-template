const { describe, test } = require('node:test');
const assert = require('node:assert');

const { dummy } = require('../src');

describe('Dummy Test', () => {
    test('should return string "dummy"', () => {
        assert.strictEqual(dummy(), 'dummy');
    });
});
