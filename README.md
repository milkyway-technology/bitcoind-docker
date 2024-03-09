<p align="center">
    <a href="https://github.com/milkyway-technology/bitcoind-docker">
    <img src="https://cdn.svgporn.com/logos/bitcoin.svg" width="80" alt="Logo" /></a>
</p>

<h1 align="center">Bitcoind Docker</h1>

<p align="center">A Docker image for bitcoind</p>

---

A Docker image for bitcoind to self-host a Bitcoin node.

## ⏩ Getting Started

### ⚙️ Installation

Install Docker and Docker Compose by using the link below
https://docs.docker.com/engine/install

Clone project
```shell
git clone https://github.com/milkyway-technology/bitcoind-docker.git
```

### 🏁 Quickstart

Start Bitcoin node
```shell
docker compose up -d
```

Stop bitcoin node
```shell
docker compose down
```

Stop Bitcoin node and delete volume
```shell
docker compose down --volumes
```

### 🛠️ Environment variables

The bitcoind container can be configured with the environment variables below.

| Variable          | Description                                                   | Default Value |
|-------------------|---------------------------------------------------------------|---------------|
| DB_CACHE          | Size of database cache (in MB)                                | 8192          |
| MAX_MEM_POOL      | Maximum memory usage (in MB) for the transaction memory pool  | 300           |
| MAX_ORPHAN_TX     | Maximum number of orphan transactions to keep in memory       | 100           |
| PRUNE             | Whether to enable pruning (1 for enabled, 0 for disabled)     | 0             |
| MAX_CONNECTIONS   | Maximum number of inbound/outbound connections                | 40            |
| MAX_UPLOAD_TARGET | Maximum upload target bandwidth (in MB/s)                     | 0             |
| CHAIN             | Blockchain chain (e.g., main, testnet)                        | main          |
| RPC_ALLOW_IP      | IP address or range to allow RPC connections from             | 0.0.0.0/0     |
| RPC_BIND          | IP address to bind RPC server to                              | 0.0.0.0       |
| RPC_PASSWORD      | Password for RPC authentication                               | satoshi       |
| RPC_USER          | Username for RPC authentication                               | bitcoin       |
| RPC_ENABLED       | Whether RPC server is enabled (1 for enabled, 0 for disabled) | 1             |


## 💻 Technologies

<img src="https://skillicons.dev/icons?i=docker" alt="technologies" />

## ✏️ License

Bitcoind Docker is distributed under the [Apache 2.0 License](LICENSE).

## ✍️ Contributors

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->

<table>
  <tr>
    <td align="center"><a href="https://github.com/lcarneli"><img src="https://avatars.githubusercontent.com/u/25481821?v=4" width="100px;" alt=""/><br /><sub><b>Lorenzo Carneli</b></sub></a><br /><a href="https://github.com/milkyway-technology/.bitcoind-docker/commits?author=lcarneli" title="Code">💻</a> <a href="#" title="Ideas">🤔</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->
<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!

---

> 🚀 Don't forget to put a ⭐️ on our repositories!