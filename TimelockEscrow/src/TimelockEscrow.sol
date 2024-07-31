// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

import "forge-std/console.sol";

contract TimelockEscrow {
    address public seller;
    mapping(address=>uint256) public buyOrders;
    uint256 public lockTime = 0;
    address currentBuyer;

    /**
     * The goal of this exercise is to create a Time lock escrow.
     * A buyer deposits ether into a contract, and the seller cannot withdraw it until 3 days passes. Before that, the buyer can take it back
     * Assume the owner is the seller
     */

    constructor() {
        seller = msg.sender;
    }

    // creates a buy order between msg.sender and seller
    /**
     * escrows msg.value for 3 days which buyer can withdraw at anytime before 3 days but afterwhich only seller can withdraw
     * should revert if an active escrow still exist or last escrow hasn't been withdrawn
     */
    function createBuyOrder() external payable {
        // your code here
        require(buyOrders[msg.sender] == 0, "There is an active escrow or last escrow has not been withdrawn");
        buyOrders[msg.sender] = msg.value;
        currentBuyer = msg.sender;
        lockTime = block.timestamp + 3 days;
    }

    /**
     * allows seller to withdraw after 3 days of the escrow with @param buyer has passed
     */
    function sellerWithdraw(address buyer) external {
        // your code here
        require(block.timestamp > lockTime, "Time lock has not expired");
        require(msg.sender == seller, "Only the seller can withdraw");
        seller.call{value:buyOrders[buyer]}("");
        buyOrders[buyer] = 0;
    }

    /**
     * allowa buyer to withdraw at anytime before the end of the escrow (3 days)
     */
    function buyerWithdraw() external {
        // your code here
        require(block.timestamp < lockTime, "Time to withdraw has already expired");
        require(buyOrders[msg.sender] > 0, "You don't have a buy order");
        msg.sender.call{value:buyOrders[msg.sender]}("");
        buyOrders[msg.sender] = 0;
    }

    // returns the escrowed amount of @param buyer
    function buyerDeposit(address buyer) external view returns (uint256) {
        // your code here
        return buyOrders[buyer];
    }
}
