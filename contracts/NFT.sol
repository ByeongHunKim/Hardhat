// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract NFT is ERC721, Ownable {
    using Strings for uint256;

    uint256 MAX_SUPPLY = 100;
    bool isSaleActice;
    uint256 totalSupply;
    mapping(uint256 => uint256) tokenMetadataNo;
    
    constructor() ERC721("tacoNFT", "NFT") {}

    function _baseURI() internal view override returns (string memory) {
        return "ipfs.io/ipfs/QmbBB2BtVVEavdFfdMgv3teiCiRDptptQ1nJgnRcYYkDmk";
    }

    function mintPlanet(uint256 _count) external payable {
      require(isSaleActice, "not on sale");
      require(msg.value >= 1000000000000000 * _count, "amount is not valid");
      require(_count <= 10, "mint maximum 10 nfts at once");
      for(uint i = 0; i < _count; i++){
        require(totalSupply < MAX_SUPPLY, "max supply exceeded");
        tokenMetadataNo[totalSupply] = 1 + uint256(blockhash(block.number)) % 10;
        _safeMint(msg.sender, totalSupply++);
      }
    }

    function tokenURI(uint256 _tokenId) public view virtual override returns (string memory) {
        _requireMinted(_tokenId);

        string memory baseURI = _baseURI();
        return string(abi.encodePacked(baseURI, tokenMetadataNo[_tokenId].toString(), '.json'));
    }

    // onlyOwner
    function setSale(bool _active) external onlyOwner{
      isSaleActice = _active;
    }

    function withdraw() external onlyOwner {
      // transfer all amount of ETH from contract to contract owner's address
      payable(msg.sender).transfer(address(this).balance);
    }

}
