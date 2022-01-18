// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.11;

import "ds-test/test.sol";
import "../contract/Incrementor.sol";

contract IncrementorTest is DSTest {
    Incrementor incrementor;

    function setUp() public {
        incrementor = new Incrementor();
    }

    function test_increment() public {
        assertTrue(true);
        incrementor.incrementX();
        assertEq(incrementor.x(), 1);
        emit log_string("okay good");
    }
}
