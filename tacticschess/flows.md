# TacticsChess Application Flows

This document outlines the main API flows for the TacticsChess backend application.

### `flow-be-001`: Request a "Mate in X" Puzzle
- **Description**: The frontend requests a specific "mate-in-X" puzzle. The backend retrieves a random FEN string corresponding to the requested mate count from its data store.
- **Endpoint**: `GET /v1/matepuzzles/random?mateInCount={X}`
- **Key Components**: `CheckMatePuzzleController`, `MatePuzzleService`, `MockMatePuzzleFenRepository`.
- **Outcome**: Returns a `MatePuzzleResponse` containing the FEN string for the puzzle, the number of moves to mate, and a list of allowed moves for the current position.

### `flow-be-002`: Request a Personalized Puzzle
- **Description**: The frontend requests a general, personalized tactical puzzle. The backend reads from a log file containing a list of puzzles, selects one at random, and returns it.
- **Endpoint**: `GET /v1/puzzles/random`
- **Data Source**: `data/puzzle/default/output_refined.log`
- **Key Components**: `PuzzleController`, `PuzzleService`, `PuzzleRepository`.
- **Outcome**: Returns a `PuzzleResponse` containing the FEN, whether it's a mate puzzle, the number of rounds (moves), a list of centipawn scores for the solution, and the allowed moves.

### `flow-be-003`: Process a Player's Move
- **Description**: This is the core gameplay engine. The frontend submits the player's move. The backend validates the move against the current position's legal moves. If valid, it updates the internal board state. It then sends the new position to the Stockfish chess engine to calculate the best counter-move. The result from Stockfish and the new board state are packaged and returned to the frontend.
- **Endpoint**: `POST /v1/chessPosition`
- **Key Components**: `ChessPositionController`, `ChessPositionService`, `StockFishClient`, `Board`.
- **Outcome**: Returns a `ChessPositionResponse` containing the original FEN, the FEN after the player's move, the FEN after the opponent's response, the game status (e.g., isCheckMate, isStalemate), and the new set of allowed moves.

### `flow-be-004`: User Authentication
- **Description**: Handles user login and session management via a token-based system.
- **Endpoints**:
  - `POST /api/auth/login`: Authenticates a user.
  - `POST /api/auth/logout`: Invalidates a user's session.
- **Key Components**: `AuthController`, `SecurityConfig`, `TokenService`, `InMemoryTokenStore`, `UserService`.
- **Login Flow**:
  1. Receives user credentials (email, password).
  2. Validates credentials against a hardcoded username and a hashed password stored in `data/cred/checkmate.properties`.
  3. If valid, generates a secure, random token with a 1-month expiry.
  4. The token and its expiry are persisted to a file at `data/users/{userId}/token.json`. This allows sessions to survive server restarts.
  5. The token is sent to the client as an `HttpOnly` cookie named `accessToken`.
- **Logout Flow**:
  1. Receives a request, which includes the `accessToken` cookie.
  2. The token is invalidated in memory.
  3. The corresponding token file at `data/users/{userId}/token.json` is deleted.
  4. The client's cookie is cleared.
- **Session Validation**: For all requests to protected endpoints, the `TokenAuthenticationFilter` validates the `accessToken` from the cookie. It checks an in-memory cache first, then falls back to the filesystem, ensuring the token exists and is not expired.
