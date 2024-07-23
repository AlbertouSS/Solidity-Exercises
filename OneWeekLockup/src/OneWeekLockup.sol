// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract OneWeekLockup {
    /**
     * In this exercise you are expected to create functions that let users deposit ether
     * Users can also withdraw their ether (not more than their deposit) but should only be able to do a week after their last deposit
     * Consider edge cases by which users might utilize to deposit ether
     *
     * Required function
     * - depositEther()
     * - withdrawEther(uint256 )
     * - balanceOf(address )
     */

    mapping (address => uint256) public balances;

    function balanceOf(address user) public view returns (uint256) {
        // return the user's balance in the contract
        return balances[user];
    }

    function depositEther() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdrawEther(uint256 amount) external {
        /// add code here
        require(block.timestamp > 7 days, "withdrawal is allowed after one week of the deposit");
        require(address(this).balance >= amount, "Not enough ETH to withdraw");
        msg.sender.call{value: amount}("");
        balances[msg.sender] -= amount;
    }
}
