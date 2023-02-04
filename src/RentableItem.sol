// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "../node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol";

abstract contract RentableItem is ERC721 {
    address internal owner;
    string internal name_new;
    string internal photo;
    string internal description;

    function getOwner() public view returns (address) {
        return owner;
    }

    function getName() public view returns (string memory) {
        return name_new;
    }

    function getPhoto() public view returns (string memory) {
        return photo;
    }

    function getDescription() public view returns (string memory) {
        return description;
    }

    function setOwner(address newOwner) public {
        owner = newOwner;
    }

    function setName(string memory newName) public {
        name_new = newName;
    }

    function setPhoto(string memory newPhoto) public {
        photo = newPhoto;
    }

    function setDescription(string memory newDescription) public {
        description = newDescription;
    }
}
