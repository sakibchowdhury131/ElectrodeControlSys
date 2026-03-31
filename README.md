# ElectrodeControlSys

A signal processing research project for electrode diameter control system design, targeting noise suppression and signal power enhancement in biomedical electrode arrays. The system analyzes Surface Myoelectric (SMES) signals and applies statistical signal processing to separate noise from useful signal components.

## Features

- Generation of synthetic SMES (Surface Myoelectric Signal) waveforms with configurable SNR
- Noise generation and characterization
- Energy-based noise/signal separation using log-histogram analysis
- Transfer function exploration for circular and square electrode geometries
- MATLAB simulation scripts for baseline signal processing comparisons
- Simulation test output storage

## Tech Stack

- Python 3
- NumPy, Matplotlib
- MATLAB (filter design and signal processing baselines)

## Project Structure

| File / Directory | Description |
|---|---|
| `main.py` | Main Python script: SMES signal + noise generation, log-histogram energy separation |
| `lib/utils.py` | Utility functions: `generateNoise()`, `generateSMES_full()` |
| `filter.m` | MATLAB filter design script |
| `gen_sig.m` | MATLAB signal generation |
| `gen_corrupted_sig.m` | MATLAB corrupted signal generation |
| `simulationsTest_1/` | Simulation output directory |

## Requirements

```
numpy
matplotlib
```

Install with:

```bash
pip install numpy matplotlib
```

MATLAB R2018b or later is required to run `.m` files.

## Usage

```bash
python main.py
```

## License

MIT
