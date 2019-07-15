//  main.swift
//  bee's hangman project
//
//  Created by Bianca Brown on 7/12/19.
//  Copyright © 2019 Bee. All rights reserved.
//

import Foundation

let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]

var wordBank = allTheWords.randomElement()!
var lostChance = 3
var playAgain: String = "N"
// will be useful if they want to play this again.
var letterArray = [Character]()
var characterIndex = [Character : [Int]]()


func gameLines () {
    for (index,letter) in wordBank.enumerated() {
        letterArray.append("_")
        if var letterIndexArray = characterIndex[letter] {
            letterIndexArray.append(index)
            characterIndex[letter] = letterIndexArray
        }
        else {
            characterIndex[letter] = [index]
        }
    }
}

// this function was created to help with the set up of lines for the letters to have a home in.

func drawLines () {
    for letter in letterArray{
        print(letter, terminator: " ")
    }
}

// this actually draws out the lines and spaces needed for each word.

func printGameBoard () {
    for letter in letterArray{
        print(letter, terminator: " ")
    }
}

// this is the container to hold the lines which were being made by the previous function.

func userInput() {
    print("\n\nChoose wisely: ", terminator: "")
    if let userGuess = readLine() {
        // check if it is in the dictonary
        if characterIndex[Character(userGuess)] != nil {
            print("You guessed a correct letter!")
            for index in characterIndex[Character(userGuess)]! {
                letterArray[index] = Character(userGuess)
            }
            // print
            printGameBoard()
            if Array(wordBank) == letterArray {
                print("")
                lostChance = -1
            }
        }
        else {
            // logic for if user guessed wrong
            print("Oh no, that was the wrong one!")
            print("You now have \(lostChance) chances. Try again.")
            printGameBoard()
            lostChance -= 1
        }
    }
}

// this is all of the code for the user. here, once executed, will give them the opportunity to actually play the game and to spice it up with customizable statements. it holds the information for if the user guesses right or guess the wrong answer.

func gameStart() {
    // Welcome Statement
    print("Welcome to Hangman ! Please tell me your name so we can get started.")
    let playerName = readLine()
    // creates username for the user
    print("Ah! \(playerName!). Thats a lovely name. Let us have some fun today! ")
    letterArray = [Character]()
    characterIndex = [Character : [Int]]()
    lostChance = 3
    // word chosen at this time as well as the counter beginning.
    wordBank = allTheWords.randomElement()!
    gameLines()
    print("\n\n\n\n")
    drawLines()
}

// this is the welcoming page for once the game boots up. they will be greeted with a message and a chance to place their username within.

repeat {
    gameStart()
    // Game Is played here
    while lostChance >= 0 {
        userInput()
    }
    print("")
    print("Boo ! You didnt guess the right word. It was \(wordBank)! And here I thought you would have gotten it right. You lost this time.")
    print("Would you like to continue & play again? y/n")
    if let restartGame = readLine(){
        if restartGame == "y"{
            playAgain = "y"
        }
        else {
            playAgain = "n"
        }
    }
} while playAgain == "y"
print()
print()
print("See you next time for more fun!")

// this is the behind the scenes work while they are playing the game. it takes in the user's input to guess the letters for each of the words.

