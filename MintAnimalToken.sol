//SPDX-License-Indetifier : MIT 

@pragma solidity ^0.8.0;
import "@openzepplin/contracts/token/ERC721/extensions/ERC721Enumerable.sol"; //NFT는 ERC721이다. 

contract MintAnimalToken is ERC721Enumerable { 
    contructor{} ERC721{"h662Animals","HAS"} {}

    function MintAnimalToken() public {
        uint256 animalTokenId = totalSupply()=1; //ERC721Enumerable에서 제공. uint256 값을 가지며 토큰의 양 반환 

        _mint(msg.sender,animalTokenId); //msgSender은 민팅 누른 사람, animalTokenId 유일한 값 
    }
}