// SPDX-License-Identifier: MIT
// SPDX 라이센스는 0.68 이후부터 솔리디티 프로그램 맨 위에 명시를 요구한다. 라이센스를 명시해줌으로써 스마트컨트랙트에 대한 신뢰감을 높이고 저작권 문제 해소 

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract MintAnimalToken is ERC721Enumerable {
    constructor() ERC721("h662Animals", "HAS") {} // constructor은 스마트 컨트랙트가 빌드될 때 한번 실행. 없으면 비워놓아도 된다. 

    mapping(uint256 => uint256) animalTypes; // 앞의 uint는 animalTokenId, 뒤에 uint는 animalTypes 

    function mintAnimalToken() public { // mint함수
        uint256 animalTokenId = totalSupply() + 1; // erc721 enumerable에서 제공 totalSupply(); totalSupply() NFT 발행량을 나타낸다. 이 값이 유일해야 NFT라고 할 수 있다. 

        // keccak256을 사용하기 위해서는 바이트코드값 필요. 바이트값 인코딩 해줘서 바이트값을 만든다. 값을 넣으면 keccak 알고리즘을 돌린다. 파라미터는 바뀌는 값이 들어가야 한다.
        // %5 하면 0~4까지 값이 나오고 +1 해주면 1~5 값이 나온다. 솔리디티에서 랜덤을 뽑아내는 방법. 
        uint256 animalType = uint256(keccak256(abi.encodePacked(block.timestamp,msg.sender,animalTokenId))) %5 +1; // 함수 실행한 시간, 누가 보냈는지, animalTokenId 

        animalTypes[animalTokenId] = animalType; // 1~5 중에 하나 값이 animalTokenId 민팅할 _mint에 들어간다. 
        
        _mint(msg.sender, animalTokenId); // MSG.SENDER은 민팅 누른 사람(구매자),animalTokenId 유일한 값. 내가 갖고 있는 NFT 토큰 아이디 증명 

    }
}