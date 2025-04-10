// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe{
    uint256 minimumUsd = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    // `payable` Allows the function to receive Ether
    function fund() public payable {
        // require(condition, errorMessage). require() reverts the whole transaction, including all state changes from prior function calls
        // msg.value is the amount of Ether (in wei) sent to the function.
        // 1e18 = 1 eth = 1000000000000000000 wei = 1 *10 ** 18 wei
        require(getConversionRate(msg.value) >= minimumUsd, "Send minimum 5$ worth of eth");
        // msg.sender refers to the address that called the function
        funders.push(msg.sender);
        // When accessing a mapping for a new key, Solidity returns the default value (0 for uint256)
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    // function withdraw() public {}

    function getPrice() public view returns(uint256) {
        // Interface defines function signatures without implementation, enabling interaction with external contracts.
        // Using the Chainlink AggregatorV3Interface to fetch the latest ETH/USD price from the deployed price feed contract.
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 answer, , , ) = priceFeed.latestRoundData();

        return uint256(answer * 1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        uint256 ethPriceUSD = getPrice();
        uint256 ethCostUSD = (ethAmount * ethPriceUSD) / 1e18;
        return ethCostUSD;
    }

}
