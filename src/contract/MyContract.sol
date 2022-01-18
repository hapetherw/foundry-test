// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.11;

contract MyContract {
    uint256 public x;
    uint256 public y;
    uint256 public z;

    /// @dev delegate incrementX to the Incrementor contract below
    /// @param inc address to delegate increment call to
    function incrementX(address inc) external {
        // storage structure should be matched when delegatecall
        // Incrementor contract storage structure is same as Challenge contract
        // should call Incrementor.incrementY function to increase x
        // storage slot is not identified by the name of variable
        // but the type of variable and its declaration order
        (bool success, ) =
            inc.delegatecall(abi.encodeWithSignature("incrementY()"));
        require(success, "failed!");
    }

    /// @dev delegate incrementY to the Incrementor contract below
    /// @param inc address to delegate increment call to
    function incrementY(address inc) external {
        // same reason as in incrementX
        (bool success, ) =
            inc.delegatecall(abi.encodeWithSignature("incrementZ()"));
        require(success, "failed!");
    }

    /// @dev delegate incrementZ to the Incrementor contract below
    /// @param inc address to delegate increment call to
    function incrementZ(address inc) external {
        // same reason as in incrementX
        (bool success, ) =
            inc.delegatecall(abi.encodeWithSignature("incrementX()"));
        require(success, "failed!");
    }

    /// @dev determines if argument account is a contract or not
    /// @param account address to evaluate
    /// @return bool if account is contract or not
    function isContract(address account) external view returns (bool) {
        // NOTE: there is a securty issue here when this is called on contructor of contract
        // EXTCODESIZE returns 0 if it is called from the constructor of a contract
        uint32 size;
        assembly {
            size := extcodesize(account)
        }
        return (size > 0);
    }

    /// @dev converts address to uint256
    /// @param account address to convert
    /// @return uint256
    function addressToUint256(address account) external pure returns (uint256) {
        // from solidity v0.8, can no longer cast explicitly from address to uint256.
        return uint256(uint160(account));
    }

    /// @dev converts uint256 to address
    /// @param num uint256 number to convert
    /// @return address
    function uint256ToAddress(uint256 num) external pure returns (address) {
        // from solidity v0.8, can no longer cast explicitly from uint256 to address.
        return address(uint160(num));
    }
}