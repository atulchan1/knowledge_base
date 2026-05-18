# Flow to Files Mapping

This document maps the application flows to the source code files that are primarily responsible for their implementation.

### `flow-001`: Application Loading & Authentication Check
- `src/main.tsx`: Entry point of the React application.
- `src/App.tsx`: Core component that contains the primary authentication state and routing logic.
- `src/vite-env.d.ts`: Provides TypeScript type definitions for the Vite environment.

### `flow-002`: User Authentication
- `src/LoginPage.tsx`: The main UI component for all authentication forms (login, signup, forgot password).
- `src/api.ts`: Contains the (mocked) API functions `loginUser`, `signUpUser`, and `forgotPassword`.
- `src/App.tsx`: Manages the `isAuthenticated` state and handles the successful login callback.

### `flow-003`: Puzzle Selection & Configuration
- `src/PuzzleHomePage.tsx`: Displays the puzzle selection tiles and the external account linking interface.
- `src/api.ts`: Contains the `verifyExternalAccount` function for validating Lichess/Chess.com usernames.
- `src/App.tsx`: Renders the `PuzzleHomePage` when the user is authenticated.

### `flow-004`: Chess Puzzle Gameplay
- `src/Chessboard.tsx`: The central component that manages the entire puzzle lifecycle, state, and user interaction.
- `src/Square.tsx`: Represents a single square on the board and handles drag-and-drop events.
- `src/api.ts`: Contains `fetchGameData` to get the initial puzzle and `fetchNewMoves` to process player moves.
- `src/config.ts`: Provides the base URL for the API calls.

### `flow-005`: Pawn Promotion
- `src/Chessboard.tsx`: Detects when a promotion move occurs and triggers the modal.
- `src/PromotionModal.tsx`: The UI component that allows the user to select a piece.
- `src/api.ts`: The `fetchNewMoves` function is called with the promotion piece information.

### `flow-006`: Puzzle Resolution
- `src/Chessboard.tsx`: Interprets the API response from `fetchNewMoves` to determine the puzzle's outcome and displays the appropriate success or error message and user actions (Retry, Next Puzzle).
- `src/api.ts`: The response from `fetchNewMoves` contains the fields (`isCheckMate`, `isStalemate`, `points`) that determine the outcome.

### `flow-007`: User Logout
- `src/App.tsx`: Contains the `handleLogout` function that clears `localStorage` and resets the authentication state.
- `src/PuzzleHomePage.tsx`: Contains a "Logout" button in the header.
- `src/Chessboard.tsx`: Contains a "Logout" button in its banner.
