// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;
import "forge-std/console.sol";

contract BlockNumber {
    /**
     * In this exercise the function lastCaller stores the address of the caller of the function in the lastCaller stateVariable
     * The task is to make this function only callable once per block.
     * If it is called more than once per block, the second and later calls revert.
     * To pass the test, it needs a storage variable that stores the last blocknumber where it was accessed.
     */

    address public _lastCaller;
    uint256 public lastBlock = 0;

    function lastCaller () public view returns (address) {
        return _lastCaller;
    }

    function callMe() external {
        /// your code here
        _lastCaller = msg.sender;
        require(lastBlock != block.number, "Function can only be called once per block");
        lastBlock = block.number;
    }
}
