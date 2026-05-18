# TacticsChess Application Flows

This document outlines the main API flows for the TacticsChess backend application.

### `flow-be-001`: Request a "Mate in X" Puzzle
- **Description**: The frontend requests a specific "mate-in-X" puzzle. The backend retrieves a random FEN string corresponding to the requested mate count from its data store.
- **Endpoint**: `GET /v1/matepuzzles/random?mateInCount={X}`
- **Key Components**: `CheckMatePuzzleController`, `MatePuzzleService`, `MockMatePuzzleFenRepository`.
- **Outcome**: Returns a `MatePuzzleResponse` containing the FEN string for the puzzle, the number of moves to mate, and a list of allowed moves for the current position.

### `flow-be-002`: Request a Personalized Puzzle
- **Description**: The frontend requests a general, personalized tactical puzzle. The backend reads from a log file (`output_refined.log`) containing a list of puzzles, selects one at random, and returns it.
- **Endpoint**: `GET /v1/puzzles/random`
- **Key Components**: `PuzzleController`, `PuzzleService`, `PuzzleRepository`.
- **Outcome**: Returns a `PuzzleResponse` containing the FEN, whether it's a mate puzzle, the number of rounds (moves), a list of centipawn scores for the solution, and the allowed moves.

### `flow-be-003`: Process a Player's Move
- **Description**: This is the core gameplay engine. The frontend submits the player's move. The backend validates the move against the current position's legal moves. If valid, it updates the internal board state. It then sends the new position to the Stockfish chess engine to calculate the best counter-move. The result from Stockfish and the new board state are packaged and returned to the frontend.
- **Endpoint**: `POST /v1/chessPosition`
- **Key Components**: `ChessPositionController`, `ChessPositionService`, `StockFishClient`, `Board`.
- **Outcome**: Returns a `ChessPositionResponse` containing the original FEN, the FEN after the player's move, the FEN after the opponent's response, the game status (e.g., isCheckMate, isStalemate), and the new set of allowed moves.

### `flow-be-004`: User Management (Placeholder)
- **Description**: This represents a placeholder for future user management functionality (e.g., registration, login, profile management). The controllers, services, and repositories exist but are not implemented.
- **Endpoint**: None.
- **Key Components**: `UserController`, `UserService`, `UserRepository`.
- **Outcome**: Not applicable as this flow is not implemented.
