
const hre = require("hardhat");
const hardhatConfig = require("../hardhat.config");


async function main() { 
const [owner] = await ethers.getSigners();
const amountDeposited = hre.ethers.utils.parseEther("500");
const amountWithdrawn = hre.ethers.utils.parseEther("29");
const StorageAndMemoryTest = await hre.ethers.getContractFactory("StorageContract");
const storageAndMemoryTest = await StorageAndMemoryTest.connect(owner).deploy();
await storageAndMemoryTest.deployed();



  console.log(
    `Contract deployed to ${storageAndMemoryTest.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
