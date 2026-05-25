# File to Flows Mapping

This document provides an inverted index, mapping each source file to the backend API flow(s) it participates in.

### `controller/AuthController.java`
- `flow-be-004`: User Authentication

### `controller/CheckMatePuzzleController.java`
- `flow-be-001`: Request a "Mate in X" Puzzle

### `controller/ChessPositionController.java`
- `flow-be-003`: Process a Player's Move

### `controller/PuzzleController.java`
- `flow-be-002`: Request a Personalized Puzzle

### `service/MatePuzzleService.java`
- `flow-be-001`: Request a "Mate in X" Puzzle

### `service/PuzzleService.java`
- `flow-be-002`: Request a Personalized Puzzle

### `service/ChessPositionService.java`
- `flow-be-003`: Process a Player's Move

### `service/UserService.java`
- `flow-be-004`: User Authentication

### `service/UserAccount.java`
- `flow-be-004`: User Authentication

### `repository/MatePuzzleFenRepository.java`
- `flow-be-001`: Request a "Mate in X" Puzzle

### `repository/MockMatePuzzleFenRepository.java`
- `flow-be-001`: Request a "Mate in X" Puzzle

### `repository/PuzzleRepository.java`
- `flow-be-002`: Request a Personalized Puzzle

### `security/SecurityConfig.java`
- `flow-be-004`: User Authentication

### `security/TokenAuthenticationFilter.java`
- `flow-be-004`: User Authentication

### `security/TokenService.java`
- `flow-be-004`: User Authentication

### `security/InMemoryTokenStore.java`
- `flow-be-004`: User Authentication

### `security/TokenData.java`
- `flow-be-004`: User Authentication

### `security/AuthRequest.java`
- `flow-be-004`: User Authentication

### `security/AuthResponse.java`
- `flow-be-004`: User Authentication

### `util/StockFishClient.java`
- `flow-be-003`: Process a Player's Move

### `domain/Board.java`
- `flow-be-001`: Request a "Mate in X" Puzzle
- `flow-be-002`: Request a Personalized Puzzle
- `flow-be-003`: Process a Player's Move

### `domain/Puzzle.java`
- `flow-be-002`: Request a Personalized Puzzle

### `model/ChessPositionRequest.java`
- `flow-be-003`: Process a Player's Move

### `model/ChessPositionResponse.java`
- `flow-be-003`: Process a Player's Move

### `model/MatePuzzleResponse.java`
- `flow-be-001`: Request a "Mate in X" Puzzle

### `model/PuzzleResponse.java`
- `flow-be-002`: Request a Personalized Puzzle
