// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFT is ERC721 {
    constructor() ERC721("sampleNFT", "NFT") {
        for(uint i = 0; i < 10; i++){
            _safeMint(msg.sender, i + 1);
        }
    }
}
