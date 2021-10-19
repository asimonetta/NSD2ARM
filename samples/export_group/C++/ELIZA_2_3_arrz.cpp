// Generated by Structorizer 3.30-11 

// Copyright (C) 2018-05-14 Kay Gürtzig 
// License: GPLv3-link 
// GNU General Public License (V 3) 
// https://www.gnu.org/licenses/gpl.html 
// http://www.gnu.de/documents/gpl.de.html 

#include <string>
#include <iostream>
using std::string;

// histArray contains the most recent user replies as ring buffer; 
// histIndex is the index where the next reply is to be stored (= index of the oldest 
// cached user reply). 
// Note: The depth of the history is to be specified by initializing a variable of this type, 
// e.g. for a history of depth 5: 
// myhistory <- History{{"", "", "", "", ""}, 0} 
struct History {
	string	histArray[50];
	int	histIndex;
};

// Associates a key word in the text with an index in the reply ring array 
struct KeyMapEntry {
	string	keyword;
	int	index;
};

// function initialize_History() 

// Automatically created initialization procedure for History 
// TODO: Revise the return type and declare the parameters. 
void initialize_History()
{
	static bool initDone_History = false;
	if (! initDone_History) {
		initDone_History = true;
	}
}

// function initialize_KeyMapEntry() 

// Automatically created initialization procedure for KeyMapEntry 
// TODO: Revise the return type and declare the parameters. 
void initialize_KeyMapEntry()
{
	static bool initDone_KeyMapEntry = false;
	if (! initDone_KeyMapEntry) {
		initDone_KeyMapEntry = true;
	}
}

// function adjustSpelling(sentence: string): string 

// Cares for correct letter case among others 
// TODO: Revise the return type and declare the parameters. 
string adjustSpelling(string sentence)
{
	// TODO: Check and accomplish variable declarations: 
	string word;
	string start;
	string result;
	int position;

	result = sentence;
	position = 1;
	while ((position <= length(sentence)) && (copy(sentence, position, 1) == " ")) {
		position = position + 1;
	}
	if (position <= length(sentence)) {
		start = copy(sentence, 1, position);
		delete(result, 1, position);
		insert(uppercase(start), result, 1);
	}
	for (auto word : {" i ", " i\'"}) {
		position = pos(word, result);
		while (position > 0) {
			delete(result, position+1, 1);
			insert("I", result, position+1);
			position = pos(word, result);
		}
	}

	return result;
}

// function checkGoodBye(text: string; phrases: array of array[0..1] of string): boolean 

// Checks whether the given text contains some kind of 
// good-bye phrase inducing the end of the conversation 
// and if so writes a correspding good-bye message and 
// returns true, otherwise false 
// TODO: Revise the return type and declare the parameters. 
bool checkGoodBye(string text, string phrases[50][2])
{
	// TODO: Check and accomplish variable declarations: 
	string pair[50];

	for (auto pair : phrases) {
		if (pos(pair[0], text) > 0) {
			std::cout << pair[1] << std::endl;
			return true;
		}
	}
	return false;
}

// function conjugateStrings(sentence: string; key: string; keyPos: integer; flexions: array of array[0..1] of string): string 

// TODO: Revise the return type and declare the parameters. 
string conjugateStrings(string sentence, string key, int keyPos, string flexions[50][2])
{
	// TODO: Check and accomplish variable declarations: 
	string right;
	string result;
	int position;
	string pair[50];
	string left;

	result = " " + copy(sentence, keyPos + length(key), length(sentence)) + " ";
	for (auto pair : flexions) {
		left = "";
		right = result;
		position = pos(pair[0], right);
		while (position > 0) {
			left = left + copy(right, 1, position-1) + pair[1];
			right = copy(right, position + length(pair[0]), length(right));
			position = pos(pair[0], right);
		}
		result = left + right;
	}
	// Eliminate multiple spaces 
	position = pos("  ", result);
	while (position > 0) {
		result = copy(result, 1, position-1) + copy(result, position+1, length(result));
		position = pos("  ", result);
	}

	return result;
}

// function normalizeInput(sentence: string): string 

// Converts the sentence to lowercase, eliminates all 
// interpunction (i.e. ',', '.', ';'), and pads the 
// sentence among blanks 
// TODO: Revise the return type and declare the parameters. 
string normalizeInput(string sentence)
{
	// TODO: Check and accomplish variable declarations: 
	char symbol;
	string result;
	int position;

	sentence = lowercase(sentence);
	for (auto symbol : {'.', ',', ';', '!', '?'}) {
		position = pos(symbol, sentence);
		while (position > 0) {
			sentence = copy(sentence, 1, position-1) + copy(sentence, position+1, length(sentence));
			position = pos(symbol, sentence);
		}
	}
	result = " " + sentence + " ";

	return result;
}

// function setupGoodByePhrases(): array of array[0..1] of string 

// TODO: Revise the return type and declare the parameters. 
//       C++ may not permit to return arrays like this - find an other way to pass the result! 
string[50][2] setupGoodByePhrases()
{
	// TODO: Check and accomplish variable declarations: 
	string phrases[50][2];

	phrases[0][0] = " shut";
	phrases[0][1] = "Okay. If you feel that way I\'ll shut up. ... Your choice.";
	phrases[1][0] = "bye";
	phrases[1][1] = "Well, let\'s end our talk for now. See you later. Bye.";
	return phrases;
}

// function setupReflexions(): array of array[0..1] of string 

// Returns an array of pairs of mutualy substitutable  
// TODO: Revise the return type and declare the parameters. 
//       C++ may not permit to return arrays like this - find an other way to pass the result! 
string[50][2] setupReflexions()
{
	// TODO: Check and accomplish variable declarations: 
	string reflexions[50][2];

	reflexions[0][0] = " are ";
	reflexions[0][1] = " am ";
	reflexions[1][0] = " were ";
	reflexions[1][1] = " was ";
	reflexions[2][0] = " you ";
	reflexions[2][1] = " I ";
	reflexions[3][0] = " your";
	reflexions[3][1] = " my";
	reflexions[4][0] = " i\'ve ";
	reflexions[4][1] = " you\'ve ";
	reflexions[5][0] = " i\'m ";
	reflexions[5][1] = " you\'re ";
	reflexions[6][0] = " me ";
	reflexions[6][1] = " you ";
	reflexions[7][0] = " my ";
	reflexions[7][1] = " your ";
	reflexions[8][0] = " i ";
	reflexions[8][1] = " you ";
	reflexions[9][0] = " am ";
	reflexions[9][1] = " are ";
	return reflexions;
}

// function setupReplies(): array of array of string 

// This routine sets up the reply rings addressed by the key words defined in 
// routine `setupKeywords()´ and mapped hitherto by the cross table defined 
// in `setupMapping()´ 
// TODO: Revise the return type and declare the parameters. 
//       C++ may not permit to return arrays like this - find an other way to pass the result! 
string[50][50] setupReplies()
{
	// TODO: Check and accomplish variable declarations: 
	string setupReplies[50][50];

	string replies[50][50];
	replies[29][0] = "Say, do you have any psychological problems?";
	replies[29][1] = "What does that suggest to you?";
	replies[29][2] = "I see.";
	replies[29][3] = "I'm not sure I understand you fully.";
	replies[29][4] = "Come come elucidate your thoughts.";
	replies[29][5] = "Can you elaborate on that?";
	replies[29][6] = "That is quite interesting.";
	replies[0][0] = "Don't you believe that I can*?";
	replies[0][1] = "Perhaps you would like to be like me?";
	replies[0][2] = "You want me to be able to*?";
	replies[1][0] = "Perhaps you don't want to*?";
	replies[1][1] = "Do you want to be able to*?";
	replies[2][0] = "What makes you think I am*?";
	replies[2][1] = "Does it please you to believe I am*?";
	replies[2][2] = "Perhaps you would like to be*?";
	replies[2][3] = "Do you sometimes wish you were*?";
	replies[3][0] = "Don't you really*?";
	replies[3][1] = "Why don't you*?";
	replies[3][2] = "Do you wish to be able to*?";
	replies[3][3] = "Does that trouble you*?";
	replies[4][0] = "Do you often feel*?";
	replies[4][1] = "Are you afraid of feeling*?";
	replies[4][2] = "Do you enjoy feeling*?";
	replies[5][0] = "Do you really believe I don't*?";
	replies[5][1] = "Perhaps in good time I will*.";
	replies[5][2] = "Do you want me to*?";
	replies[6][0] = "Do you think you should be able to*?";
	replies[6][1] = "Why can't you*?";
	replies[7][0] = "Why are you interested in whether or not I am*?";
	replies[7][1] = "Would you prefer if I were not*?";
	replies[7][2] = "Perhaps in your fantasies I am*?";
	replies[8][0] = "How do you know you can't*?";
	replies[8][1] = "Have you tried?";
	replies[8][2] = "Perhaps you can now*.";
	replies[9][0] = "Did you come to me because you are*?";
	replies[9][1] = "How long have you been*?";
	replies[9][2] = "Do you believe it is normal to be*?";
	replies[9][3] = "Do you enjoy being*?";
	replies[10][0] = "We were discussing you--not me.";
	replies[10][1] = "Oh, I*.";
	replies[10][2] = "You're not really talking about me, are you?";
	replies[11][0] = "What would it mean to you if you got*?";
	replies[11][1] = "Why do you want*?";
	replies[11][2] = "Suppose you soon got*...";
	replies[11][3] = "What if you never got*?";
	replies[11][4] = "I sometimes also want*.";
	replies[12][0] = "Why do you ask?";
	replies[12][1] = "Does that question interest you?";
	replies[12][2] = "What answer would please you the most?";
	replies[12][3] = "What do you think?";
	replies[12][4] = "Are such questions on your mind often?";
	replies[12][5] = "What is it that you really want to know?";
	replies[12][6] = "Have you asked anyone else?";
	replies[12][7] = "Have you asked such questions before?";
	replies[12][8] = "What else comes to mind when you ask that?";
	replies[13][0] = "Names don't interest me.";
	replies[13][1] = "I don't care about names -- please go on.";
	replies[14][0] = "Is that the real reason?";
	replies[14][1] = "Don't any other reasons come to mind?";
	replies[14][2] = "Does that reason explain anything else?";
	replies[14][3] = "What other reasons might there be?";
	replies[15][0] = "Please don't apologize!";
	replies[15][1] = "Apologies are not necessary.";
	replies[15][2] = "What feelings do you have when you apologize?";
	replies[15][3] = "Don't be so defensive!";
	replies[16][0] = "What does that dream suggest to you?";
	replies[16][1] = "Do you dream often?";
	replies[16][2] = "What persons appear in your dreams?";
	replies[16][3] = "Are you disturbed by your dreams?";
	replies[17][0] = "How do you do ...please state your problem.";
	replies[18][0] = "You don't seem quite certain.";
	replies[18][1] = "Why the uncertain tone?";
	replies[18][2] = "Can't you be more positive?";
	replies[18][3] = "You aren't sure?";
	replies[18][4] = "Don't you know?";
	replies[19][0] = "Are you saying no just to be negative?";
	replies[19][1] = "You are being a bit negative.";
	replies[19][2] = "Why not?";
	replies[19][3] = "Are you sure?";
	replies[19][4] = "Why no?";
	replies[20][0] = "Why are you concerned about my*?";
	replies[20][1] = "What about your own*?";
	replies[21][0] = "Can you think of a specific example?";
	replies[21][1] = "When?";
	replies[21][2] = "What are you thinking of?";
	replies[21][3] = "Really, always?";
	replies[22][0] = "Do you really think so?";
	replies[22][1] = "But you are not sure you*?";
	replies[22][2] = "Do you doubt you*?";
	replies[23][0] = "In what way?";
	replies[23][1] = "What resemblance do you see?";
	replies[23][2] = "What does the similarity suggest to you?";
	replies[23][3] = "What other connections do you see?";
	replies[23][4] = "Could there really be some connection?";
	replies[23][5] = "How?";
	replies[23][6] = "You seem quite positive.";
	replies[24][0] = "Are you sure?";
	replies[24][1] = "I see.";
	replies[24][2] = "I understand.";
	replies[25][0] = "Why do you bring up the topic of friends?";
	replies[25][1] = "Do your friends worry you?";
	replies[25][2] = "Do your friends pick on you?";
	replies[25][3] = "Are you sure you have any friends?";
	replies[25][4] = "Do you impose on your friends?";
	replies[25][5] = "Perhaps your love for friends worries you.";
	replies[26][0] = "Do computers worry you?";
	replies[26][1] = "Are you talking about me in particular?";
	replies[26][2] = "Are you frightened by machines?";
	replies[26][3] = "Why do you mention computers?";
	replies[26][4] = "What do you think machines have to do with your problem?";
	replies[26][5] = "Don't you think computers can help people?";
	replies[26][6] = "What is it about machines that worries you?";
	replies[27][0] = "Do you sometimes feel uneasy without a smartphone?";
	replies[27][1] = "Have you had these phantasies before?";
	replies[27][2] = "Does the world seem more real for you via apps?";
	replies[28][0] = "Tell me more about your family.";
	replies[28][1] = "Who else in your family*?";
	replies[28][2] = "What does family relations mean for you?";
	replies[28][3] = "Come on, How old are you?";
	setupReplies = replies;

	return setupReplies;
}

// function checkRepetition(history: History; newInput: string): boolean 

// Checks whether newInput has occurred among the recently cached 
// input strings in the histArray component of history and updates the history. 
// TODO: Revise the return type and declare the parameters. 
bool checkRepetition(History history, string newInput)
{
	// TODO: Check and accomplish variable declarations: 
	int histDepth;
	bool hasOccurred;

	initialize_History();
	
	hasOccurred = false;
	if (length(newInput) > 4) {
		histDepth = length(history.histArray);
		for (int i = 0; i <= histDepth-1; i += (1)) {
			if (newInput == history.histArray[i]) {
				hasOccurred = true;
			}
		}
		history.histArray[history.histIndex] = newInput;
		history.histIndex = (history.histIndex + 1) % (histDepth);
	}
	return hasOccurred;
}

// function findKeyword(const keyMap: array of KeyMapEntry; sentence: string): array[0..1] of integer 

// Looks for the occurrence of the first of the strings 
// contained in keywords within the given sentence (in 
// array order). 
// Returns an array of 
// 0: the index of the first identified keyword (if any, otherwise -1), 
// 1: the position inside sentence (0 if not found) 
// TODO: Revise the return type and declare the parameters. 
//       C++ may not permit to return arrays like this - find an other way to pass the result! 
int[2] findKeyword(const array of KeyMapEntry keyMap, string sentence)
{
	// TODO: Check and accomplish variable declarations: 
	int result[2];
	int position;
	int i;

	initialize_KeyMapEntry();
	
	result[0] = -1;
	result[1] = 0;
	i = 0;
	while ((result[0] < 0) && (i < length(keyMap))) {
		KeyMapEntry entry = keyMap[i];
		position = pos(entry.keyword, sentence);
		if (position > 0) {
			result[0] = i;
			result[1] = position;
		}
		i = i+1;
	}

	return result;
}

// function setupKeywords(): array of KeyMapEntry 

// The lower the index the higher the rank of the keyword (search is sequential). 
// The index of the first keyword found in a user sentence maps to a respective 
// reply ring as defined in `setupReplies()´. 
// TODO: Revise the return type and declare the parameters. 
//       C++ may not permit to return arrays like this - find an other way to pass the result! 
KeyMapEntry[50] setupKeywords()
{
	// TODO: Check and accomplish variable declarations: 
	// The empty key string (last entry) is the default clause - will always be found 
	KeyMapEntry keywords[50];

	initialize_KeyMapEntry();
	
	// The empty key string (last entry) is the default clause - will always be found 
	keywords[39].keyword  = "";
	keywords[39].index  = 29;
	keywords[0].keyword  = "can you ";
	keywords[0].index  = 0;
	keywords[1].keyword  = "can i ";
	keywords[1].index  = 1;
	keywords[2].keyword  = "you are ";
	keywords[2].index  = 2;
	keywords[3].keyword  = "you\'re ";
	keywords[3].index  = 2;
	keywords[4].keyword  = "i don't ";
	keywords[4].index  = 3;
	keywords[5].keyword  = "i feel ";
	keywords[5].index  = 4;
	keywords[6].keyword  = "why don\'t you ";
	keywords[6].index  = 5;
	keywords[7].keyword  = "why can\'t i ";
	keywords[7].index  = 6;
	keywords[8].keyword  = "are you ";
	keywords[8].index  = 7;
	keywords[9].keyword  = "i can\'t ";
	keywords[9].index  = 8;
	keywords[10].keyword  = "i am ";
	keywords[10].index  = 9;
	keywords[11].keyword  = "i\'m ";
	keywords[11].index  = 9;
	keywords[12].keyword  = "you ";
	keywords[12].index  = 10;
	keywords[13].keyword  = "i want ";
	keywords[13].index  = 11;
	keywords[14].keyword  = "what ";
	keywords[14].index  = 12;
	keywords[15].keyword  = "how ";
	keywords[15].index  = 12;
	keywords[16].keyword  = "who ";
	keywords[16].index  = 12;
	keywords[17].keyword  = "where ";
	keywords[17].index  = 12;
	keywords[18].keyword  = "when ";
	keywords[18].index  = 12;
	keywords[19].keyword  = "why ";
	keywords[19].index  = 12;
	keywords[20].keyword  = "name ";
	keywords[20].index  = 13;
	keywords[21].keyword  = "cause ";
	keywords[21].index  = 14;
	keywords[22].keyword  = "sorry ";
	keywords[22].index  = 15;
	keywords[23].keyword  = "dream ";
	keywords[23].index  = 16;
	keywords[24].keyword  = "hello ";
	keywords[24].index  = 17;
	keywords[25].keyword  = "hi ";
	keywords[25].index  = 17;
	keywords[26].keyword  = "maybe ";
	keywords[26].index  = 18;
	keywords[27].keyword  = " no";
	keywords[27].index  = 19;
	keywords[28].keyword  = "your ";
	keywords[28].index  = 20;
	keywords[29].keyword  = "always ";
	keywords[29].index  = 21;
	keywords[30].keyword  = "think ";
	keywords[30].index  = 22;
	keywords[31].keyword  = "alike ";
	keywords[31].index  = 23;
	keywords[32].keyword  = "yes ";
	keywords[32].index  = 24;
	keywords[33].keyword  = "friend ";
	keywords[33].index  = 25;
	keywords[34].keyword  = "computer";
	keywords[34].index  = 26;
	keywords[35].keyword  = "bot ";
	keywords[35].index  = 26;
	keywords[36].keyword  = "smartphone";
	keywords[36].index  = 27;
	keywords[37].keyword  = "father ";
	keywords[37].index  = 28;
	keywords[38].keyword  = "mother ";
	keywords[38].index  = 28;
	return keywords;
}
// program ELIZA 

// Concept and lisp implementation published by Joseph Weizenbaum (MIT): 
// "ELIZA - A Computer Program For the Study of Natural Language Communication Between Man and Machine" - In: 
// Computational Linguistis 1(1966)9, pp. 36-45 
// Revision history: 
// 2016-10-06 Initial version 
// 2017-03-29 Two diagrams updated (comments translated to English) 
// 2017-03-29 More keywords and replies added 
// 2019-03-14 Replies and mapping reorganised for easier maintenance 
// 2019-03-15 key map joined from keyword array and index map 
// 2019-03-28 Keyword "bot" inserted (same reply ring as "computer") 
// 2019-11-28 New global type "History" (to ensure a homogenous array) 
int main(void)
{
	// TODO: Check and accomplish variable declarations: 
	string varPart;
	// Converts the input to lowercase, cuts out interpunctation 
	// and pads the string 
	string userInput;
	string reply;
	int posAster;
	int offsets[50];
	bool isRepeated;
	bool isGone;
	int findInfo[2];

	initialize_History();
	initialize_KeyMapEntry();
	
	// Title information 
	std::cout << "************* ELIZA **************" << std::endl;
	std::cout << "* Original design by J. Weizenbaum" << std::endl;
	std::cout << "**********************************" << std::endl;
	std::cout << "* Adapted for Basic on IBM PC by" << std::endl;
	std::cout << "* - Patricia Danielson" << std::endl;
	std::cout << "* - Paul Hashfield" << std::endl;
	std::cout << "**********************************" << std::endl;
	std::cout << "* Adapted for Structorizer by" << std::endl;
	std::cout << "* - Kay Gürtzig / FH Erfurt 2016" << std::endl;
	std::cout << "* Version: 2.3 (2020-02-24)" << std::endl;
	std::cout << "* (Requires at least Structorizer 3.30-03 to run)" << std::endl;
	std::cout << "**********************************" << std::endl;
	// Stores the last five inputs of the user in a ring buffer, 
	// the second component is the rolling (over-)write index. 
	History history = {{"", "", "", "", ""}, 0};
	const string replies[50][50] = setupReplies();
	const string reflexions[50][2] = setupReflexions();
	const string byePhrases[50][2] = setupGoodByePhrases();
	const KeyMapEntry keyMap[50] = setupKeywords();
	offsets[length(keyMap)-1] = 0;
	isGone = false;
	// Starter 
	std::cout << "Hi! I\'m your new therapist. My name is Eliza. What\'s your problem?" << std::endl;
	do {
		std::cin >> userInput;
		// Converts the input to lowercase, cuts out interpunctation 
		// and pads the string 
		// Converts the input to lowercase, cuts out interpunctation 
		// and pads the string 
		userInput = normalizeInput(userInput);
		isGone = checkGoodBye(userInput, byePhrases);
		if (! isGone) {
			reply = "Please don\'t repeat yourself!";
			isRepeated = checkRepetition(history, userInput);
			if (! isRepeated) {
				findInfo = findKeyword(keyMap, userInput);
				??? keyIndex = findInfo[0];
				if (keyIndex < 0) {
					// Should never happen... 
					keyIndex = length(keyMap)-1;
				}
				KeyMapEntry entry = keyMap[keyIndex];
				// Variable part of the reply 
				varPart = "";
				if (length(entry.keyword) > 0) {
					varPart = conjugateStrings(userInput, entry.keyword, findInfo[1], reflexions);
				}
				??? replyRing = replies[entry.index];
				reply = replyRing[offsets[keyIndex]];
				offsets[keyIndex] = (offsets[keyIndex] + 1) % length(replyRing);
				posAster = pos("*", reply);
				if (posAster > 0) {
					if (varPart == " ") {
						reply = "You will have to elaborate more for me to help you.";
					}
					else {
						delete(reply, posAster, 1);
						insert(varPart, reply, posAster);
					}
				}
				reply = adjustSpelling(reply);
			}
			std::cout << reply << std::endl;
		}
	} while (! (isGone));

	return 0;
}
