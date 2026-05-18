# Checkmate Application Flows

This document outlines the main user and data flows within the Checkmate frontend application.

### `flow-001`: Application Loading & Authentication Check
- **Description**: The initial loading process of the application. It checks `localStorage` for an existing session token to determine if the user is already authenticated.
- **Trigger**: User opens the web page.
- **Outcome**: Based on the presence and validity of the token, the application either renders the `LoginPage` (for unauthenticated users) or the `PuzzleHomePage` (for authenticated users).

### `flow-002`: User Authentication
- **Description**: Encompasses the complete user authentication lifecycle, including signing in, creating a new account, and handling forgotten passwords.
- **Trigger**: User interacts with the Login, Sign Up, or Forgot Password forms on the `LoginPage`.
- **Outcome**: On successful login/signup, a mock authentication token is stored, and the user is redirected to the `PuzzleHomePage`. For password resets, a confirmation message is shown.

### `flow-003`: Puzzle Selection & Configuration
- **Description**: Allows the authenticated user to choose a puzzle type from the home page. This flow also includes the functionality for linking and verifying external accounts (Lichess, Chess.com) to personalize puzzles.
- **Trigger**: User clicks on a puzzle tile (e.g., "Personalized") on the `PuzzleHomePage`.
- **Outcome**: The `Chessboard` component is rendered, configured with the parameters for the selected puzzle type.

### `flow-004`: Chess Puzzle Gameplay
- **Description**: The core gameplay loop. It begins by fetching puzzle data from the backend. It then manages the player's moves (via drag-and-drop), validates them against the allowed moves, and submits the chosen move to the backend for processing. The backend's response (opponent's move) is used to update the board state.
- **Trigger**: The `Chessboard` component mounts or the user makes a move on the board.
- **Outcome**: The chessboard state is continuously updated, advancing the puzzle toward its conclusion.

### `flow-005`: Pawn Promotion
- **Description**: A critical sub-flow of the main gameplay. It is initiated when a player moves a pawn to the final rank of the board.
- **Trigger**: A valid pawn move to the 1st or 8th rank.
- **Outcome**: A modal dialog (`PromotionModal`) is displayed, forcing the user to choose a piece (Queen, Rook, Bishop, or Knight) to promote the pawn to before the move can be completed.

### `flow-006`: Puzzle Resolution
- **Description**: The concluding part of the gameplay loop. It processes the final state of a puzzle, which can be a success (checkmate, correct tactical sequence) or failure (incorrect move, being checkmated).
- **Trigger**: The backend API response indicates a terminal state (mate, stalemate, puzzle solved/failed) or the player makes a move not in the solution set.
- **Outcome**: An outcome message is displayed to the user, with options to "Retry", "Review", or start a "Next Puzzle".

### `flow-007`: User Logout
- **Description**: The process for a user to sign out of the application.
- **Trigger**: User clicks the "Logout" button.
- **Outcome**: The session token and any related user data are cleared from `localStorage`, and the user is redirected to the `LoginPage`.
