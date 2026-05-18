# Tags to Flow Mapping

This document defines a set of tags for key concepts and maps them to the relevant application flows for the Puzzlegen tool.

### Tag Definitions
- **`data-pipeline`**: A primary flow that is part of the overall data processing pipeline.
- **`http-client`**: Involves making outbound HTTP requests to an external API.
- **`pgn-parsing`**: Logic related to parsing Portable Game Notation (PGN) files.
- **`chess-engine-integration`**: Involves direct interaction with the Stockfish chess engine process.
- **`file-io`**: Involves reading from or writing to the local file system.
- **`domain-model`**: Relies on the core chess domain objects (e.g., `Board`, `Piece`).
- **`inactive-code`**: A flow that is currently disabled via commented-out code.

---

### Tag to Flow Mappings

#### `data-pipeline`
- `flow-pg-001`: Download and Parse PGNs
- `flow-pg-002`: Find Missed Tactics
- `flow-pg-003`: Refine Puzzles

#### `http-client`
- `flow-pg-001`: Download and Parse PGNs

#### `pgn-parsing`
- `flow-pg-001`: Download and Parse PGNs

#### `chess-engine-integration`
- `flow-pg-002`: Find Missed Tactics
- `flow-pg-003`: Refine Puzzles

#### `file-io`
- `flow-pg-002`: Find Missed Tactics (Writes to `output.log`)
- `flow-pg-003`: Refine Puzzles (Reads `output.log`, writes to `output_refined.log`)

#### `domain-model`
- `flow-pg-002`: Find Missed Tactics
- `flow-pg-003`: Refine Puzzles

#### `inactive-code`
- `flow-pg-002`: Find Missed Tactics
- `flow-pg-003`: Refine Puzzles
