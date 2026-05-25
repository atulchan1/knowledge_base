# Tags to Flow Mapping

This document defines a set of tags for key concepts and maps them to the relevant application flows. This allows for quick discovery of flows related to a specific technical or functional domain.

### Tag Definitions
- **`authentication`**: Related to user identity, login, logout, and account creation.
- **`api-call`**: Involves direct communication with the backend API.
- **`ui-component`**: Pertains to a primary, interactive user interface component.
- **`state-management`**: Involves the management of application or component state.
- **`chess-logic`**: Core logic directly related to the rules and state of the chess game.
- **`routing`**: Concerns the logic of which view or component is displayed to the user.
- **`local-storage`**: Involves reading from or writing to the browser's `localStorage`.
- **`puzzle-lifecycle`**: Manages the start, progression, and end of a chess puzzle.

---

### Tag to Flow Mappings

#### `authentication`
- `flow-001`: Application Loading & Authentication Check
- `flow-002`: User Authentication
- `flow-007`: User Logout

#### `api-call`
- `flow-002`: User Authentication
- `flow-003`: Puzzle Selection & Configuration
- `flow-004`: Chess Puzzle Gameplay
- `flow-006`: Puzzle Resolution

#### `ui-component`
- `flow-002`: User Authentication (`LoginPage`)
- `flow-003`: Puzzle Selection & Configuration (`PuzzleHomePage`)
- `flow-004`: Chess Puzzle Gameplay (`Chessboard`, `Square`)
- `flow-005`: Pawn Promotion (`PromotionModal`)

#### `state-management`
- `flow-001`: Application Loading & Authentication Check
- `flow-004`: Chess Puzzle Gameplay
- `flow-006`: Puzzle Resolution
- `flow-007`: User Logout

#### `chess-logic`
- `flow-004`: Chess Puzzle Gameplay
- `flow-005`: Pawn Promotion
- `flow-006`: Puzzle Resolution

#### `routing`
- `flow-001`: Application Loading
- `flow-003`: Puzzle Selection & Configuration

#### `puzzle-lifecycle`
- `flow-003`: Puzzle Selection & Configuration
- `flow-004`: Chess Puzzle Gameplay
- `flow-006`: Puzzle Resolution
