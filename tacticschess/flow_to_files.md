# Flow to Files Mapping

This document maps the backend API flows to the source code files that are primarily responsible for their implementation.

### `flow-be-001`: Request a "Mate in X" Puzzle
- `controller/CheckMatePuzzleController.java`: Defines the REST endpoint.
- `service/MatePuzzleService.java`: Contains the business logic for retrieving the puzzle.
- `repository/MatePuzzleFenRepository.java`: Interface for the puzzle data store.
- `repository/MockMatePuzzleFenRepository.java`: Mock implementation that provides hardcoded FEN strings.
- `model/MatePuzzleResponse.java`: The DTO returned to the client.

### `flow-be-002`: Request a Personalized Puzzle
- `controller/PuzzleController.java`: Defines the REST endpoint.
- `service/PuzzleService.java`: Contains the business logic for retrieving a random puzzle.
- `repository/PuzzleRepository.java`: Reads and parses the puzzle data from a file (`output_refined.log`).
- `domain/Puzzle.java`: Record representing a puzzle from the data file.
- `model/PuzzleResponse.java`: The DTO returned to the client.

### `flow-be-003`: Process a Player's Move
- `controller/ChessPositionController.java`: Defines the REST endpoint.
- `service/ChessPositionService.java`: Orchestrates the move validation, execution, and call to the chess engine.
- `util/StockFishClient.java`: The client responsible for interacting with the external Stockfish process.
- `domain/Board.java`: The core domain object used to represent the game state, validate moves, and generate FEN.
- `model/ChessPositionRequest.java`: The DTO received from the client.
- `model/ChessPositionResponse.java`: The DTO returned to the client.

### `flow-be-004`: User Management (Placeholder)
- `controller/UserController.java`: Placeholder controller.
- `service/UserService.java`: Placeholder service.
- `repository/UserRepository.java`: Placeholder repository.
