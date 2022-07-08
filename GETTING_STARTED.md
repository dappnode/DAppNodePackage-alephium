This package contains an Alephium Node and a local block explorer.

**Using your own node with Alephium Desktop Wallet:**

In order to connect your Desktop Wallet with your own node, go to "Settings > Network" of the Destkop Wallet, select "Custom" network and input the following values:

 - **Node host**: [alephium.alephium.dappnode:12973](http://alephium.alephium.dappnode:12973)

 - **Explorer API host**: [explorer-backend.alephium.dappnode:9090](http://explorer-backend.alephium.dappnode:9090)

 - **Explorer URL**: [explorer-frontend.alephium.dappnode:3000](http://explorer-frontend.alephium.dappnode:3000)

Then "Save".

⚠️ **Important**: You will have to wait for your node to synchronize to connect the wallet UI to your node.

**Monitoring:**
It includes a Grafana dashboard for the [DMS](http://my.dappnode/#/installer/dms.dnp.dappnode.eth)

**Other URLs:**
 - **WebSocket**: ws://alephium.alephium.dappnode:11973
 - **Miner API**: http://alephium.alephium.dappnode:10973

🛠️**Troubleshooting**🛠️
If your Destkop Wallet can't access your node, make sure your router has the following ports open:
**Ports**: Expose 9973 (TCP and UDP)
