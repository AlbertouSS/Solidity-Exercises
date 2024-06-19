// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;
import "forge-std/console.sol";

contract Mean {
    /**
     * The goal of this exercise is to return the mean of the numbers in "arr"
     */
    function mean(uint256[] calldata arr) public view returns (uint256) {
        // your code here
        uint256 total = 0;
        for(uint256 i = 0; i < arr.length; i++){
            total += arr[i];
        }
        console.log(total/arr.length);
        return total/arr.length;
    }
}
