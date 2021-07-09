const path = require("path");

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  contracts_build_directory: path.join(__dirname, "client/src/contracts"),
  networks: {
    development: {
      host: "127.0.0.1",
      port: 9545,
      network_id: "*",
    },
    // goerli: {
    //   provider: function() {
    //     return new HDWalletProvider(process.env.MNEMONIC, "https://goerli.infura.io/v3/process.env.GOERLI");
    //   },
    //   network_id: '5',
    // },
  },
  compilers: {
    solc: {
      version: "^0.8.6",
    },
  },
};
