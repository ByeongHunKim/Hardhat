# Hardhat

# 목차

[1.reference](#1.-reference)

[2.installation](#2.-installation)

[3.file directory](#3.-file-directory)

[4.testing contract](#4.-testing-contract)

[5.deploying contract](#5.-deploying-contract)

## 1. reference

## [Hardhat docs](https://hardhat.org/hardhat-runner/docs/getting-started#overview)

## 2. installation

- node v16.17.1
- npm 8.15.0

```shell
npx hardhat init
npm install -—save @openzeppelin/contracts
```

## 3. file directory

### 3.1 contracts/

- 스마트 컨트랙트 소스코드 파일 보관

### 3.2 scripts/

- 스마트 컨트랙트를 배포할 때 실행하는 스크립트코드 파일 보관

### 3.3 test/

- 스마트 컨트랙트를 테스트하는 소스코드 파일 보관

### 3.4 hardhat.config.ts

- 이더리움 테스트넷 또는 메인넷 등 스마트 컨트랙트를 배포할 네트워크를 설정할 수 있는 config 파일

## 4. testing contract

- `test/` 폴더에 있는 파일 실행

```shell
npx hardhat test test/example.ts
```

## 5. deploying contract

- `scripts/` 폴더에 있는 파일 실행

```shell
npx hardhat run scripts/deploy.ts --network goerli
```

### NFT.sol

### [transaction history ](https://goerli.etherscan.io/tx/0x9449b7b8260b58114ccc211244add5b769bb419aa30d0d73ea8b4b6d5ef2330c)

- Sales 기간에만 민팅 가능 ( Sales는 contract owner가 설정 가능 )
  - 발행량 : 최대 100개
  - 개당 가격 : 0.0001 ETH
  - 한번에 10개의 NFT 구매 가능
- 랜덤한 NFT 지급을 위한 랜덤 index 생성
- 컨트랙트에 쌓인 ETH 인출 가능
