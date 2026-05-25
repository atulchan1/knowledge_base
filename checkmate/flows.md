# Checkmate Application Flows

This document outlines the main user and data flows within the Checkmate frontend application.

### `flow-001`: Application Loading
- **Description**: The initial loading process of the application. The application starts in an unauthenticated state.
- **Trigger**: User opens the web page.
- **Outcome**: The application renders the `LoginPage`.

### `flow-002`: User Authentication
- **Description**: Encompasses the user authentication lifecycle. The user submits their credentials via a login form.
- **Trigger**: User submits the login form on the `LoginPage`.
- **Key Components**: `LoginPage.tsx`, `api.ts`, `App.tsx`.
- **Outcome**: 
  1. A `POST` request is made to the backend's `/api/auth/login` endpoint.
  2. On success, the backend sets an `HttpOnly` cookie named `accessToken`.
  3. The frontend's root component (`App.tsx`) updates its state to `isAuthenticated = true`.
  4. The application re-renders to show the `PuzzleHomePage`.
  5. The "Sign Up" and "Forgot Password" flows are currently client-side mocks and do not interact with the backend.

### `flow-003`: Puzzle Selection & Configuration
- **Description**: Allows the authenticated user to choose a puzzle type from the home page. This flow also includes the functionality for linking and verifying external accounts (Lichess, Chess.com) to personalize puzzles.
- **Trigger**: User clicks on a puzzle tile (e.g., "Personalized") on the `PuzzleHomePage`.
- **Outcome**: The `Chessboard` component is rendered, configured with the parameters for the selected puzzle type.

### `flow-004`: Authenticated API Requests
- **Description**: For any API call to a protected backend endpoint (e.g., fetching a puzzle), the browser automatically includes the `accessToken` cookie with the request.
- **Trigger**: Any API call made using the `fetchWithAuth` wrapper in `api.ts`.
- **Outcome**: The backend validates the token and processes the request. If the token is invalid or expired, the backend returns a `401 Unauthorized` status. The frontend catches this, triggers a logout, and redirects the user to the `LoginPage`.

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
- **Key Components**: `App.tsx`, `api.ts`.
- **Outcome**: 
  1. A `POST` request is sent to the backend's `/api/auth/logout` endpoint to invalidate the token on the server side.
  2. The frontend state is updated (`isAuthenticated = false`).
  3. The user is redirected to the `LoginPage`.
