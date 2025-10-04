# Graph-Based Number Guessing Game (JAC vs. Python)

## Project Overview
This project implements the classic "Guess the Number" game using the JAC (Jaseci's Action Composition Language). It serves as a powerful demonstration of JAC's graph-centric architecture, showcasing how Walkers, Nodes, and explicit state management can simplify complex application logic compared to traditional Object-Oriented Programming (OOP) in Python.

---

**Key Feature:** The game integrates with a Large Language Model (Gemini) to provide rich, dynamic hints to the player, orchestrated entirely within the JAC framework.

---

## JAC: A Different Approach to Game Logic
While the original Python version relied on sequential execution within a class method `(game.play())`, the JAC version refactors the application into a persistent graph structure and autonomous agents.


In a standard Python class, the game's core logic and state management are encapsulated within a single method like `play()`, which executes sequentially. Conversely, the JAC version leverages a graph execution model where the game state is a persistent `node` (the turn), and the game loop is simply a `walker` (the agent) traversing the graph using `visit [-->]`. This shift offers superior clarity and persistence, as the state is visually represented on the graph rather than being hidden inside a function's runtime scope. 

Furthermore, while Python requires explicit threading or asynchronous libraries to handle multiple players or concurrent guesses, JAC achieves this naturally by simply `spawning` multiple `walkers` that simultaneously interact with the single game state `node`. This provides native concurrency, making it easy to test multiple inputs or users without complex external libraries. 

Finally, while a Python game manages its turn limit using a decrementing integer (`self.attempts -= 1`), JAC's limit is managed by the number of `nodes` or edges in the traversal path, offering visual logic where the game's constraints are inherent to its physical structure (e.g., ten nodes equals ten turns). This entire system is made even more powerful by JAC's built-in AI integration, which replaces boilerplate API call code with a simple declarative syntax (`def give_hint(...) by llm()`), allowing for clean and seamless delegation of dynamic hint generation to the Gemini LLM.

---

## Setup and Execution

**Prerequisites**
- JAC Runtime installed.

- A valid Gemini API Key.

** **
1. Set Your API Key
   
  - The project requires your API key to generate dynamic hints. Set it as an environment variable (recommended):

    `export GEMINI_API_KEY="YOUR_API_KEY_HERE"`

2. Run the Game

  - Execute the JAC file directly:

    `jac run guessing-game6.jac`


The game will simulate four concurrent "players" (walkers) making their first guess, with the Gemini model providing real-time feedback based on the secret number set on the graph node.
