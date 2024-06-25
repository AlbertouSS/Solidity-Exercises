// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;
import "forge-std/console.sol";

contract TicTacToe {
    /* 
        This exercise assumes you know how to manipulate nested array.
        1. This contract checks if TicTacToe board is winning or not.
        2. Write your code in `isWinning` function that returns true if a board is winning
           or false if not.
        3. Board contains 1's and 0's elements and it is also a 3x3 nested array.
    */

    function isWinning(uint8[3][3] memory board) public pure returns (bool) {
        // your code here
        // [1, 1, 0]                    [0, 1, 0]
        // [0, 1, 0] -> isWinning       [0, 1, 0] -> isNotWinning
        // [1, 0, 1]                    [1, 0, 1]

        uint256 row1 = board[0][0]+board[0][1]+board[0][2];
        uint256 row2 = board[1][0]+board[1][1]+board[1][2];
        uint256 row3 = board[2][0]+board[2][1]+board[2][2];
        uint256 col1 = board[0][0]+board[1][0]+board[2][0];
        uint256 col2 = board[0][1]+board[1][1]+board[2][1];
        uint256 col3 = board[0][2]+board[1][2]+board[2][2];
        uint256 diag1 = board[0][0]+board[1][1]+board[2][2];
        uint256 diag2 = board[0][2]+board[1][1]+board[2][0];

        if((row1 == 3) || (row2 == 3) || (row3 == 3) || (col1 == 3) || (col2 == 3) || 
        (col3 == 3) || (diag1 == 3) || (diag2 == 3)){
            return true;
        }
        else{
            return false;
        }
        // // console.log(row1, row2, row3);
        // console.log(board[0][0], board[0][1], board[0][2]);
        // console.log(board[1][0], board[1][1], board[1][2]);
        // console.log(board[2][0], board[2][1], board[2][2]);
        
    }
}
