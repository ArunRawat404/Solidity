// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

// library is a special type of contract that contains reusable code, Cannot hold state varible and all functions are marked internal
library PriceConverter {
    function getPrice() internal view returns(uint256) {
        // Interface defines function signatures without implementation, enabling interaction with external contracts.
        // Using the Chainlink AggregatorV3Interface to fetch the latest ETH/USD price from the deployed price feed contract.
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 answer, , , ) = priceFeed.latestRoundData();

        return uint256(answer * 1e10);
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
        uint256 ethPriceUSD = getPrice();
        uint256 ethCostUSD = (ethAmount * ethPriceUSD) / 1e18;
        return ethCostUSD;
    }
}
