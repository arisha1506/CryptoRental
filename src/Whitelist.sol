//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Whitelist {
    address private admin;
    address private delegatedAdmin;
    mapping(address => Person) private persons;
    mapping(address => bool) private whitelist;
    struct Person {
        string person_name;
        string tel_number;
        string passport;
        string licence;
        string face;
    }

    constructor() {
        admin = msg.sender;
        whitelist[admin] = true;
    }

    function delegateAdmin(address newAdmin) external onlyAdmin {
        require(newAdmin != address(0), "ADDRESS ZERO");
        require(newAdmin != admin, "DUPLICATE");
        whitelist[delegatedAdmin] = false;
        delegatedAdmin = newAdmin;
        whitelist[delegatedAdmin] = true;
    }

    modifier onlyAdmin {
        require(msg.sender == admin || msg.sender == delegatedAdmin, "FORBIDDEN");
        _;
    }

    function inWhiteList(address user) public view returns (bool) {
        return whitelist[user];
    }

    function addToWhiteList(
        address user,
        string memory person_name_,
        string memory tel_number_,
        string memory passport_,
        string memory licence_,
        string memory face_
    ) external onlyAdmin {
        require(!inWhiteList(user), "ADDRESS ALREADY IN WHITELIST");
        whitelist[user] = true;
        persons[user] = Person(person_name_, tel_number_, passport_, licence_, face_);
    }

    function removeFromWhiteList(address user) external onlyAdmin {
        require(inWhiteList(user), "ADDRESS NOT IN WHITELIST");
        whitelist[user] = false;
        delete persons[user];
    }

    function getAdmin() external view returns (address) {
        return admin;
    }

    function getDelegatedAdmin() external view returns (address) {
        return delegatedAdmin;
    }

    function getPerson(address user) external view returns (Person memory) {
        require(inWhiteList(user), "ADDRESS NOT IN WHITELIST");
        return persons[user];
    }
}
