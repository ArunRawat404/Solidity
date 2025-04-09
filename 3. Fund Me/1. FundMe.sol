// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract FundMe{    
    // `payable` Allows the function to receive Ether
    function fund() public payable {
        // require(condition, errorMessage). require() reverts the whole transaction, including all state changes from prior function calls
        // msg.value is the amount of Ether (in wei) sent to the function.
        // 1e18 = 1 eth = 1000000000000000000 wei = 1 *10 ** 18 wei
        require(msg.value > 1e18, "Send a minimum of 1 eth");
    }

    // function withdraw() public {}
}
