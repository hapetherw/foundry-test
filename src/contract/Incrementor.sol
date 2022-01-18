// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "../console.sol";

contract Incrementor {
    uint256 public y;
    uint256 public z;
    uint256 public x;

    function incrementX() external {
        x++;
        console.log(x);
    }

    function incrementY() external {
        y++;
    }

    function incrementZ() external {
        z++;
    }
}