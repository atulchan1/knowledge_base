# Flow to Files Mapping

This document maps the application flows to the source code files that are primarily responsible for their implementation.

### `flow-001`: Application Loading #authentication #routing
- `src/main.tsx`: Entry point of the React application.
- `src/App.tsx`: Core component that contains the primary authentication state and renders the correct initial page.

### `flow-002`: User Authentication #authentication #api-call
- `src/LoginPage.tsx`: The main UI component for the login form.
- `src/api.ts`: Contains the `loginUser` function that calls the backend API.
- `src/App.tsx`: Manages the `isAuthenticated` state and handles the successful login callback.
- `src/config.ts`: Provides the base URL for the API call.

### `flow-003`: Puzzle Selection & Configuration
- `src/PuzzleHomePage.tsx`: Displays the puzzle selection tiles and the external account linking interface.
- `src/api.ts`: Contains the `verifyExternalAccount` function for validating Lichess/Chess.com usernames.
- `src/App.tsx`: Renders the `PuzzleHomePage` when the user is authenticated.

### `flow-004`: Authenticated API Requests #api-call
- `src/api.ts`: The `fetchWithAuth` wrapper automatically includes the auth cookie. It also handles 401 errors by triggering a logout.
- `src/Chessboard.tsx`: An example of a component that uses `fetchWithAuth` (via `fetchGameData` and `fetchNewMoves`) to interact with protected endpoints.

### `flow-005`: Pawn Promotion #chess-logic
- `src/Chessboard.tsx`: Detects when a promotion move occurs and triggers the modal.
- `src/PromotionModal.tsx`: The UI component that allows the user to select a piece.
- `src/api.ts`: The `fetchNewMoves` function is called with the promotion piece information.

### `flow-006`: Puzzle Resolution #puzzle-lifecycle
- `src/Chessboard.tsx`: Interprets the API response from `fetchNewMoves` to determine the puzzle's outcome and displays the appropriate success or error message and user actions (Retry, Next Puzzle).
- `src/api.ts`: The response from `fetchNewMoves` contains the fields (`isCheckMate`, `isStalemate`, `points`) that determine the outcome.

### `flow-007`: User Logout #authentication #api-call
- `src/App.tsx`: Contains the `handleLogout` function that calls the logout API and resets the authentication state.
- `src/api.ts`: Contains the `logoutUser` function.
- `src/PuzzleHomePage.tsx`: Contains a "Logout" button that triggers the flow.
