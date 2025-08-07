# QKD-App-Vaults

## QKD Vault Key Aggregator
<p float="left">
    <img src="upb.png" alt="University Politehnica of Bucharest" width="50"/>
    <img src="Logo.png" alt="Quantum Team @ UPB" width="100"/>
</p>

### Description

This application aggregates QKD generated keys into a vault for later use.  It connects to a broker that coordinates multiple clients and exchanges keys via the [QKDGKT](https://github.com/QuantumUPB/QKD-Infra-GetKey) tooling.

### Requirements

- Python 3
- Access to a QKD device usable by [QKDGKT](https://github.com/QuantumUPB/QKD-Infra-GetKey)

### Installation

1. Clone this repository and the QKDGKT helper next to it:
   ```bash
   git clone https://github.com/QuantumUPB/QKD-App-Vaults.git
   git clone https://github.com/QuantumUPB/QKD-Infra-GetKey.git QKD-App-Vaults/src/QKD-Infra-GetKey
   ```
2. Install the Python dependencies:
   ```bash
   cd QKD-App-Vaults
   pip install -r requirements.txt
   pip install -r src/QKD-Infra-GetKey/requirements.txt
   ```
3. Copy `src/config_sample.toml` to `src/config.toml` and update it with the
   broker information and desired segment size.  The application will use
   `config.toml` if present and fall back to the sample file otherwise.

### Usage

#### GUI client

1. **Start the broker** (once per network):
   ```bash
   python src/broker.py
   ```
   Leave this process running.
2. **Run the GUI client** in a different terminal:
   ```bash
   python src/qvault.py
   ```
3. In the GUI, fill in the broker IP/port and your name, then connect.
4. Use *Refresh Client List* to see other participants and click *Run* to generate a vault with a selected client.  Generated keys are saved to CSV files named `<peer>_YYYYMMDD-HHMMSS.csv` in the current directory.

#### CLI client

```bash
python src/qvault_cli.py list-clients --name <your-name>
python src/qvault_cli.py run <peer> --name <your-name>
```

The CLI uses the same underlying functionality as the GUI but provides a terminal-based interface.

### Copyright and license

This work has been implemented by Alin-Bogdan Popa and Bogdan-Calin Ciobanu, under the supervision of prof. Pantelimon George Popescu, within the Quantum Team in the Computer Science and Engineering department,Faculty of Automatic Control and Computers, National University of Science and Technology POLITEHNICA Bucharest (C) 2024. In any type of usage of this code or released software, this notice shall be preserved without any changes.

If you use this software for research purposes, please follow the instructions in the "Cite this repository" option from the side panel.

This work has been partly supported by RoNaQCI, part of EuroQCI, DIGITAL-2021-QCI-01-DEPLOY-NATIONAL, 101091562.
