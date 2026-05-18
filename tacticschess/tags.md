# Tags to Flow Mapping

This document defines a set of tags for key concepts and maps them to the relevant backend API flows.

### Tag Definitions
- **`api-endpoint`**: A flow that is exposed as a REST API endpoint.
- **`business-logic`**: The core service layer logic for a flow.
- **`data-access`**: Pertains to data retrieval or storage, either from a file or a mock repository.
- **`chess-engine-integration`**: Involves direct interaction with the Stockfish chess engine process.
- **`domain-model`**: Relies on the core chess domain objects (e.g., `Board`, `Piece`).
- **`dto`**: Uses Data Transfer Objects for API requests or responses.
- **`spring-boot`**: A core flow managed by the Spring Boot framework.

---

### Tag to Flow Mappings

#### `api-endpoint`
- `flow-be-001`: Request a "Mate in X" Puzzle
- `flow-be-002`: Request a Personalized Puzzle
- `flow-be-003`: Process a Player's Move

#### `business-logic`
- `flow-be-001`: Request a "Mate in X" Puzzle
- `flow-be-002`: Request a Personalized Puzzle
- `flow-be-003`: Process a Player's Move

#### `data-access`
- `flow-be-001`: Request a "Mate in X" Puzzle
- `flow-be-002`: Request a Personalized Puzzle

#### `chess-engine-integration`
- `flow-be-003`: Process a Player's Move

#### `domain-model`
- `flow-be-001`: Request a "Mate in X" Puzzle
- `flow-be-002`: Request a Personalized Puzzle
- `flow-be-003`: Process a Player's Move

#### `dto`
- `flow-be-001`: Request a "Mate in X" Puzzle
- `flow-be-002`: Request a Personalized Puzzle
- `flow-be-003`: Process a Player's Move

#### `spring-boot`
- `flow-be-001`: Request a "Mate in X" Puzzle
- `flow-be-002`: Request a Personalized Puzzle
- `flow-be-003`: Process a Player's Move
- `flow-be-004`: User Management (Placeholder)
