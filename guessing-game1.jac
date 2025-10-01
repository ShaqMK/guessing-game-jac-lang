"""A Number Guessing Game"""

import random;

class Game {
    def init(self: Game, attempts: int = 10) {
        self.attempts = attempts;
        self.won = False;
    }

    def play(self: Game) {
        raise NotImplementedError("Subclasses must implement this method");
    }
}

