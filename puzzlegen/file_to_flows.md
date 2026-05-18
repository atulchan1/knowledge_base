# File to Flows Mapping

This document provides an inverted index, mapping each key source file to the application flow(s) it participates in.

### `TacticschessApplication.java`
- `flow-pg-001`: Download and Parse PGNs
- `flow-pg-002`: Find Missed Tactics (Inactive)
- `flow-pg-003`: Refine Puzzles (Inactive)

### `util/StockFishClient.java`
- `flow-pg-002`: Find Missed Tactics (Inactive)
- `flow-pg-003`: Refine Puzzles (Inactive)

### `util/NotationUtil.java`
- `flow-pg-001`: Download and Parse PGNs (Used in the game replay part of the flow)

### `domain/Board.java`
- `flow-pg-002`: Find Missed Tactics (Inactive)
- `flow-pg-003`: Refine Puzzles (Inactive)

### `model/Game.java`
- `flow-pg-001`: Download and Parse PGNs

### `model/MovePair.java`
- `flow-pg-001`: Download and Parse PGNs
