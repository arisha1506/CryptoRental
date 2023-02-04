// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "./RentableItem.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract RentableCar is RentableItem {
    string private current_location;
    string private next_location;
    uint256 private power;
    string private type_car;
    uint256[] private time_span;
    uint256[] private price;

    constructor(string memory name_, string memory symbol_) ERC721(name_, symbol_) {}

    function getCurrentLocation() public view returns (string memory) {
        return current_location;
    }

    function getNextLocation() public view returns (string memory) {
        return next_location;
    }

    function getPower() public view returns (uint256) {
        return power;
    }

    function getTypeCar() public view returns (string memory) {
        return type_car;
    }

    function getTimeSpan() public view returns (uint256[] memory) {
        return time_span;
    }

    function getPrice() public view returns (uint256[] memory) {
        return price;
    }

    function setCurrentLocation(string memory newCurrentLocation) public {
        current_location = newCurrentLocation;
    }

    function setNextLocation(string memory newNextLocation) public {
        next_location = newNextLocation;
    }

    function setTypeCar(string memory newTypeCar) public {
        type_car = newTypeCar;
    }

    function setPower(uint256 newPower) public {
        power = newPower;
    }

    function setTimeSpan(uint256[] memory newTimeSpan) public {
        time_span = newTimeSpan;
    }

    function setPrice(uint256[] memory newPrice) public {
        price = newPrice;
    }
}
