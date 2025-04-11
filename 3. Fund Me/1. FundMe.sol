// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {PriceConverter} from "./2. PriceConverter.sol";

contract FundMe {
    // Attach all the functions from the PriceConverter library to the uint256 type.
    using PriceConverter for uint256;

    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    address public owner;

    // The constructor is a special function executes only once - at the time of contract deployment.
    constructor() {
        // Set the contract owner to the address that deployed the contract
        owner = msg.sender;
    }

    // `payable` Allows the function to receive Ether
    function fund() public payable {
        // require(condition, errorMessage). require() reverts the whole transaction, including all state changes from prior function calls
        // msg.value is the amount of Ether (in wei) sent to the function.
        // 1e18 = 1 eth = 1000000000000000000 wei = 1 *10 ** 18 wei
        // Under the hood msg.value.getConversionRate() converts to PriceConverter.getConversionRate(msg.value)
        // In case of multiple arguments, first argument is always the value you're calling from (in this case msg.value), and the rest you pass normally.
        require(msg.value.getConversionRate() >= minimumUsd, "Send minimum 5$ worth of eth");
        // msg.sender refers to the address that called the function
        funders.push(msg.sender);
        // When accessing a mapping for a new key, Solidity returns the default value (0 for uint256)
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    // onlyOwner is function modifier
    function withdraw() public onlyOwner {
        // reset the mapping addressToAmountFunded
        // for (init; condition; increment)
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        // reset funders arrray
        funders = new address[](0);

        /*
         *        We can send Ether to other contracts by transfer, call and send.
         *        To send native tokens like ETH, we need to convert the recipient's address to a payable address — done through typecasting.
         */

        // transfer (2300 gas, throws error)
        // payable(msg.sender).transfer(address(this).balance);

        // send (2300 gas, returns bool)
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send Failed");

        // call (forward all gas or set gas, returns a tuple (bool success, bytes memory data))
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call Failed");
    }

    // Modifier: Reusable condition that runs before a function to restrict or control access.
    modifier onlyOwner(){
        require(msg.sender == owner, "Sender is not the owner!");
        // The _ is a placeholder for the rest of the function body.
        _;
    }
}
