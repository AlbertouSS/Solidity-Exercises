// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;
import "forge-std/console.sol";

contract IsSorted {
    /**
     * The goal of this exercise is to return true if the members of "arr" is sorted (in ascending order) or false if its not.
     */
    function isSorted(uint256[] calldata arr) public view returns (bool) {
        // your code here
        // uint256 arr_lenght = arr.length;
        for(uint256 i = 1; i < arr.length; i++){
            console.log(i);
            if (!(arr[i] >= arr[i-1])){
                return false;
            }
            // else{
            //     return true;
            // }
        }
        return true;
    }
}
