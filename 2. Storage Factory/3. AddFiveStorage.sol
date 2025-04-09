// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./1. SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {
    // use override` to override a virtual function from the parent contract.
    function store(uint256 _newNumber) public override {
        myFavoriteNumber = _newNumber + 5;
    }
}
