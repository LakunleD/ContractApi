// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract ContractApi {
    struct Product {
        uint256 id;
        string name;
        uint256 price;
        uint256 quantity;
    }

    address owner;
    Product public removeMe;

    mapping (uint256 => Product) public products;
    Product [] public productArray;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function setProduct(uint256 _id, string memory _name, uint256 _price, uint256 _quantity) public onlyOwner {
        Product memory product = Product(_id, _name, _price, _quantity);
        products[_id] = product; 
        productArray.push(Product(_id, _name, _price, _quantity));
    }

}
