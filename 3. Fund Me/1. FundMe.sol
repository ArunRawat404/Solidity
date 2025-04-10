// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {PriceConverter} from "./2. PriceConverter.sol";

contract FundMe{
    // Attach all the functions from the PriceConverter library to the uint256 type.
    using PriceConverter for uint256;

    uint256 minimumUsd = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

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

    // function withdraw() public {}
}
