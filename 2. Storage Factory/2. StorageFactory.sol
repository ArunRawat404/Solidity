// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage public simpleStorage;

    function createSimpleStorageContract() public {
        // The new keyword is used to deploy a new contract from within another contract.
        //  It returns the address of the newly deployed contract. 
        simpleStorage = new SimpleStorage();
    }
}
