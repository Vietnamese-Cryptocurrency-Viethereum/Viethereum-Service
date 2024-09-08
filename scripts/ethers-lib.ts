import { ethers } from 'ethers'

/**
 * Deploy the given contract
 * @param {string} contractName name of the contract to deploy
 * @param {Array<any>} args list of constructor parameters
 * @param {Number} accountIndex account index from the exposed account
 * @return {Contract} deployed contract
 */
export const deploy = async (contractName: string = 'Viethereum', args: Array<any> = [], accountIndex?: number): Promise<ethers.Contract> => {
  console.log(`Deploying ${contractName}`)

  // Path to the contract's JSON artifact
  const artifactsPath = `browser/contracts/artifacts/${contractName}.json` 

  // Fetch metadata from Remix
  const metadata = JSON.parse(await remix.call('fileManager', 'getFile', artifactsPath))
  
  // Initialize provider and signer
  const provider = new ethers.providers.Web3Provider(web3Provider)
  const signer = provider.getSigner(accountIndex)

  // Create contract factory from ABI and bytecode
  const factory = new ethers.ContractFactory(metadata.abi, metadata.data.bytecode.object, signer)

  // Deploy the contract with constructor arguments
  const contract = await factory.deploy(...args)

  // Wait until the contract is mined
  await contract.deployed()
  console.log(`Contract deployed to address: ${contract.address}`)
  return contract
}
