// SPDX-License-Identifier: MIT

pragma solidity 0.8.18; // solidity compiler version
 
contract SimpleStorage {
    // uint is initialized to 0 if no value is given
    uint256 public favoriteNumber; // 0

    // visiblity specifiers: public, private, external, internal. By default it will be internal
    function store(uint __favoriteNumber) public {
        favoriteNumber = __favoriteNumber;
    }

    // view keyword allows only to read the state from blockchain 
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
}
