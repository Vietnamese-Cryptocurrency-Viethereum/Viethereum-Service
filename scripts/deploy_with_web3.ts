import { deploy } from './web3-lib'

(async () => {
  try {
    const result = await deploy('Viethereum', [])
    console.log(`Address: ${result.address}`)
  } catch (e) {
    console.log(e.message)
  }
})()
