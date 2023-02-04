// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "./RentableItem.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract RentableFlat is RentableItem {
    string public location;
    uint256 public squre_meters;
    uint256 public num_rooms;
    bool public allow_pets;
    uint256[] private time_span_flat;
    uint256[] private price_flat;

    constructor(string memory name_, string memory symbol_) ERC721(name_, symbol_) {}

    function getLocation() public view returns (string memory) {
        return location;
    }

    function getSqureMeters() public view returns (uint256) {
        return squre_meters;
    }

    function getNumRooms() public view returns (uint256) {
        return num_rooms;
    }

    function getAllowPets() public view returns (bool) {
        return allow_pets;
    }

    function getTimeSpanFlat() public view returns (uint256[] memory) {
        return time_span_flat;
    }

    function getPriceFlat() public view returns (uint256[] memory) {
        return price_flat;
    }

    function setLocation(string memory newLocation) public {
        location = newLocation;
    }

    function setSqureMeters(uint256 newSqureMeters) public {
        squre_meters = newSqureMeters;
    }

    function setNumRooms(uint256 newNumRooms) public {
        num_rooms = newNumRooms;
    }

    function setAllowPets(bool newAllowPets) public {
        allow_pets = newAllowPets;
    }

    function setTimeSpanFlat(uint256[] memory newTimeSpanFlat) public {
        time_span_flat = newTimeSpanFlat;
    }

    function setPriceFlat(uint256[] memory newPriceFlat) public {
        price_flat = newPriceFlat;
    }
}
