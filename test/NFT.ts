import { ethers } from 'hardhat';
import { Signer } from 'ethers';
import { expect } from 'chai';

// describe : 여러 테스트 코드를 모아 놓은 집합
describe('NFT', function() {
    let owner: Signer;
    // before : 테스트코드가 실행되기 전에 먼저 실행되어야 하는 것
    before(async () => {
        [owner] = await ethers.getSigners();
    });

    // it : 테스트코드
    it('should be have 10 NFTs', async() => {
        const NFT = await ethers.getContractFactory('NFT');
        const contract = await NFT.deploy();

        await contract.deployed();

        // expect : 조건문
        expect(await contract.balanceOf(await owner.getAddress())).to.be.equal(10);
    });
});